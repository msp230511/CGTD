# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

TodoEntry.delete_all

TodoEntry.create!(name: 'Do Laundry', description: 'Do all laundry by tonight', priority: 2, category: 'Personal',
                  due_at: Time.now.advance(days: 1).to_s, completed: false)
TodoEntry.create!(name: 'Walk the Dog', description: "Mom said if I don't do it she will be really mad", priority: 3,
                  category: 'Personal', due_at: Time.now.advance(hours: 5).to_s, completed: false)
TodoEntry.create!(name: 'Finish Math Homework', description: 'Chapter 3, Sec. 5-10', priority: 3, category: 'Work',
                  due_at: Time.now.advance(days: 5).to_s, completed: false)
TodoEntry.create!(name: 'Learn how to do a Backflip',
                  description: 'Seriously: https://www.youtube.com/watch?v=ltho8_PzC2U', priority: 1, category: 'Personal', due_at: Time.now.advance(days: 10).to_s, completed: false)
TodoEntry.create!(name: 'Finish the Dishes', description: 'The bowls are lookin kinda sus', priority: 1,
                  category: 'Personal', due_at: Time.now.advance(hours: 3).to_s, completed: false)
TodoEntry.create!(name: 'Meditate for 20 minutes', description: 'Gotta do it', priority: 1, category: 'Personal',
                  due_at: Time.now.advance(hours: 1).to_s, completed: false)
TodoEntry.create!(name: 'Finish CSS Styling for This App!', description: 'Gotta do it.', priority: 3, category: 'Work',
                  due_at: Time.now.advance(days: 5).to_s, completed: false)
