class EmbeddingService
  MODEL = "gemini-embedding-001"

  def self.call(text)
    RubyLLM.embed(
      text,
      provider: :gemini,
      model: MODEL
    ).vectors
  end
end
