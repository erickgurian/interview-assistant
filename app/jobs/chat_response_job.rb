class ChatResponseJob < ApplicationJob
  def perform(chat_id, content)
    chat = Chat.find(chat_id)

    chunks = RagService.search(content)

    context = chunks.pluck(:content).join("\n\n")

    instructions = <<~TXT
      Você é um assistente técnico.

      Responda apenas com base no contexto fornecido.

      Se o contexto não tiver informação suficiente, diga:
      "não encontrei essa informação nos documentos"

      Se não houver informações, diga:
      "não encontrei essa informação nos documentos"

      Seja objetivo.

      Contexto:
      #{context}
    TXT

    chat.with_instructions(instructions)

    chat.ask(content) do |chunk|
      if chunk.content && !chunk.content.empty?
        message = chat.messages.last
        message.broadcast_append_chunk(chunk.content)
      end
    end
  end
end
