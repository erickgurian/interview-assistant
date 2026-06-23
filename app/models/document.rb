class Document < ApplicationRecord
  has_many :document_chunks

  after_commit :index_document

  def index_document
    IndexDocumentJob.perform_later(id)
  end

  def chunk!
    title = content[/^#\s+(.+)$/, 1]

    sections = content.split(/^## /).drop(1)

    sections.each do |section|
      document_chunks.create!(
        content: "#{title}\n\n#{section}"
      )
    end
  end
end
