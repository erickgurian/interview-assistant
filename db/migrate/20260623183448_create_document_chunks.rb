class CreateDocumentChunks < ActiveRecord::Migration[8.1]
  def change
    create_table :document_chunks do |t|
      t.text :content
      t.belongs_to :document, foreign_key: true, null: false

      t.timestamps
    end
  end
end
