class DocumentChunk < ApplicationRecord
  belongs_to :document

  has_neighbors :embedding

  def generate_embedding!
    self.embedding = EmbeddingService.call(content)
    save!
  end
end
