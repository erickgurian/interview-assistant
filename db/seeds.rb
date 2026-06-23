Dir[Rails.root.join("db/seeds/markdown/*.md")].each do |file_path|
  content = File.read(file_path)
  title = File.basename(file_path, ".md")

  document = Document.find_or_initialize_by(title: title.humanize)
  document.content = content
  document.save!
end
