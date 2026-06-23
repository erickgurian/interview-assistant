class RagService
  def self.search(question)
    question_embedding = EmbeddingService.call(question)

    DocumentChunk
      .nearest_neighbors(:embedding, question_embedding, distance: "cosine")
      .limit(10)
  end
end
