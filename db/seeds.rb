# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Dir[Rails.root.join("db/seeds/markdown/*.md")].each do |file_path|
  content = File.read(file_path)
  title = File.basename(file_path, ".md")

  document = Document.find_or_initialize_by(title: title.humanize)
  document.content = content
  document.save!

  content.split("\n\n").each do |chunk|
    DocumentChunk.create!(
      document: document,
      content: chunk
    )
  end
end