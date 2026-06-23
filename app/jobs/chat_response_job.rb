class ChatResponseJob < ApplicationJob
  def perform(chat_id, content)
    chat = Chat.find(chat_id)

    context = Document.pluck(:content).join("\n\n")
    instructions = <<~TXT
      Você é um assistente técnico.
      Responda apenas com base no contexto.
      Não repita o contexto.
      Se não souber, responda: não encontrei essa informação nos documentos.

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
