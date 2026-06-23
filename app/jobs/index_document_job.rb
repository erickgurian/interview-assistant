class IndexDocumentJob < ApplicationJob
  def perform(document_id)
    document = Document.find(document_id)

    document.chunk!

    document.document_chunks.find_each do |chunk|
      chunk.generate_embedding!
    end
  end
end
