# frozen_string_literal: true

# PRECONDITIONS & PRE-CONFIGURATION --------------------------------
Given('these tasks:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |h|
    TodoEntry.create!(h)
  end
end

Given('I am on the index page') do
  visit(todo_entries_path)
end

# LOCATION ---------------------------------------------------------
Then('I should be on the index page') do
  expect(page.current_path).to eq(todo_entries_path).or eq('/')
end

Then('I should be on the create page') do
  expect(page.current_path).to eq(new_todo_entry_path)
end

Then('I should be on the edit page for {string}') do |name|
  expect(page.current_path).to eq(edit_todo_entry_path(TodoEntry.find_by_name(name)))
end

# ACTIONS ----------------------------------------------------------
When('I click the {string} button for the task {string}') do |button_class, task|
  found = false
  found = true unless (find('tr', text: task).find(".#{button_class}").click).nil?
  expect(found).to be(true)
end

When('I press {string}') do |button|
  click_on button
end

When('I fill in the following:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |field|
    fill_in field['Field'], with: field['Value']
  end
end

# STATES -----------------------------------------------------------
Then('{string} should be an active task') do |string|
  expect(all('td.task_name').any? { |td| td.text == string }).to eq(true)
end

Then('{string} should be a completed task') do |string|
  expect(all('td.completed_task_name').any? { |td| td.text == string }).to eq(true)
end

Then('{string} should not be an active task') do |string|
  expect(all('td.task_name').any? { |td| td.text == string }).to eq(false)
end

Then('{string} should not be a completed task') do |string|
  expect(all('td.completed_task_name').any? { |td| td.text == string }).to eq(false)
end

Then('the task {string} should exist') do |string|
    exists = all('td.task_name').any? { |td| td.text == string } or all('td.completed_task_name').any? { |td| td.text == string }
    expect(exists).to be(true)
end

Then('the task {string} should not exist') do |string|
    exists = all('td.task_name').any? { |td| td.text == string } or all('td.completed_task_name').any? { |td| td.text == string }
    expect(exists).to be(false)
end

Then('{string} should appear before {string}') do |string, string2|
  # pending # Write code here that turns the phrase above into concrete actions
  
  debugger
end