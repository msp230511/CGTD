# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

TodoEntry.delete_all
TodoList.delete_all
User.delete_all

user = User.create!(email: 'admin@colgate.edu', password: 'colgate13')
list1 = TodoList.create!(list_name: 'Various Tasks')
user.todo_lists << list1

TodoEntry.create!(name: 'Do Laundry', description: 'Do all laundry by tonight', priority: 2, category: 'Personal',
                  due_at: Time.now.advance(days: 1).to_s, completed: false, todo_list_id: list1.id)
TodoEntry.create!(name: 'Walk the Dog', description: "Mom said if I don't do it she will be really mad", priority: 3,
                  category: 'Personal', due_at: Time.now.advance(hours: 5).to_s, completed: false, todo_list_id: list1.id)
TodoEntry.create!(name: 'Finish Math Homework', description: 'Chapter 3, Sec. 5-10', priority: 3, category: 'Work',
                  due_at: Time.now.advance(days: 5).to_s, completed: false, todo_list_id: list1.id)
TodoEntry.create!(name: 'Learn how to do a Backflip',
                  description: 'Seriously: https://www.youtube.com/watch?v=ltho8_PzC2U', priority: 1, category: 'Personal', due_at: Time.now.advance(days: 10).to_s, completed: false, todo_list_id: list1.id)
TodoEntry.create!(name: 'Finish the Dishes', description: 'The bowls are lookin kinda sus', priority: 1,
                  category: 'Personal', due_at: Time.now.advance(hours: 3).to_s, completed: false, todo_list_id: list1.id)
TodoEntry.create!(name: 'Meditate for 20 minutes', description: 'Gotta do it', priority: 1, category: 'Personal',
                  due_at: Time.now.advance(hours: 1).to_s, completed: false, todo_list_id: list1.id)
TodoEntry.create!(name: 'Finish CSS Styling for This App!', description: 'Gotta do it.', priority: 3, category: 'Work',
                  due_at: Time.now.advance(days: 5).to_s, completed: false, todo_list_id: list1.id)

list2 = TodoList.create!(list_name: 'Software Engineering Project 1')
user.todo_lists << list2

TodoEntry.create!(name: 'Create GitHub Repo', description: 'Add teammates as contributers and start writing User Stories', priority: 1,
                  category: 'Work', due_at: Time.now.advance(hours: 3).to_s, completed: false, todo_list_id: list2.id)
TodoEntry.create!(name: 'Write Tests',
                  description: 'TDD so we must write test that before developling the code required to pass', priority: 2, category: 'Work',
                  due_at: Time.now.advance(days: 1).to_s, completed: false, todo_list_id: list2.id)
TodoEntry.create!(name: 'Write User Stories', description: 'Be sure to follow SMART prinicples', priority: 1,
                  category: 'Work', due_at: Time.now.advance(hours: 1).to_s, completed: false, todo_list_id: list2.id)
TodoEntry.create!(name: 'Change Datastructures',
                  description: 'Introduce Many to Many Relationhips for Users and TodoLists and push it to the github repo', priority: 2, category: 'Work',
                  due_at: Time.now.advance(days: 5).to_s, completed: false, todo_list_id: list2.id)
TodoEntry.create!(name: 'Learn how to do a Backflip',
                  description: 'Seriously its good to destress: https://www.youtube.com/watch?v=ltho8_PzC2U', priority: 1, category: 'Work',
                  due_at: Time.now.advance(days: 10).to_s, completed: false, todo_list_id: list2.id)
TodoEntry.create!(name: 'Team Meeting', description: 'Meet with team and figure out how we will present the project', priority: 1, category: 'Work',
                  due_at: Time.now.advance(hours: 1).to_s, completed: false, todo_list_id: list2.id)
TodoEntry.create!(name: 'Finish CSS Styling for This App!', description: 'Make it aethtically pleasing, we want users to enjoy navigating application', priority: 3, category: 'Work',
                  due_at: Time.now.advance(days: 5).to_s, completed: false, todo_list_id: list2.id)

list3 = TodoList.create!(list_name: 'My First Movie')
user.todo_lists << list3

TodoEntry.create!(name: 'Decide on a genre', description: 'I want to make a drama comedy film', priority: 1,
                  category: 'Work', due_at: Time.now.advance(hours: 3).to_s, completed: false, todo_list_id: list3.id)
TodoEntry.create!(name: 'Write My Ideas',
                  description: 'Im thinking... another movie about a dog that can play basketball', priority: 2, category: 'Work',
                  due_at: Time.now.advance(days: 1).to_s, completed: false, todo_list_id: list3.id)
TodoEntry.create!(name: 'Buy a Journal', description: 'Writing on something strange that happened during your day could be a start to a whole new idea for my script', priority: 1,
                  category: 'Work', due_at: Time.now.advance(hours: 1).to_s, completed: false, todo_list_id: list3.id)
