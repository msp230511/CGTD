# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

TodoEntry.delete_all

TodoEntry.create!(name: "Do Laundry", description: "Do all laundry by tonight", priority: "medium",category: "personal",due_at: "#{Time.now}",completed:false)
TodoEntry.create!(name: "Walk the Dog", description: "Mom said if I don't do it she will be really mad", priority: "high",category: "personal",due_at: "#{Time.now}",completed:false)
TodoEntry.create!(name: "Finish Math Homework", description: "Chapter 3, Sec. 5-10", priority: "high",category: "work",due_at: "#{Time.now}",completed:false)
TodoEntry.create!(name: "Learn how to do a Backflip", description: "Seriously: https://www.youtube.com/watch?v=ltho8_PzC2U", priority: "low",category: "personal",due_at: "#{Time.now}",completed:false)
TodoEntry.create!(name: "Finish the Dishes", description: "The bowls are lookin kinda sus", priority: "low",category: "personal",due_at: "#{Time.now}",completed:false)
TodoEntry.create!(name: "Meditate for 20 minutes", description: "Gotta do it", priority: "low",category: "personal",due_at: "#{Time.now}",completed:false)