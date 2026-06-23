class CreateDocumentChunks < ActiveRecord::Migration[8.1]
  def change
    create_table :document_chunks do |t|
      t.references :document, null: false, foreign_key: true
      t.text :content
      t.vector :embedding, limit: 3072

      t.timestamps
    end
  end
end
