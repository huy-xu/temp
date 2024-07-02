# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Board.create([
  { title: 'First Board', description: 'This is the first board.', author: 'Alice', assignee: 'Bob', created_at: Time.now, updated_at: Time.now },
  { title: 'Second Board', description: 'This is the second board.', author: 'Charlie', assignee: 'Alice', created_at: Time.now, updated_at: Time.now },
  { title: 'Third Board', description: 'This is the third board.', author: 'Bob', assignee: 'Charlie', created_at: Time.now, updated_at: Time.now }
])