# frozen_string_literal: true

# PRECONDITIONS & PRE-CONFIGURATION --------------------------------
Given('these tasks:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |h|
    TodoEntry.create!(h)
  end
end

Given('these Users:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |h|
    u = User.new(h)
    u.save
  end
end

Given('these lists:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |h|
    u = TodoList.new(list_name: h['list_name'])
    u.save
    User.find(h['user_id']).todo_lists << u
  end
end

Given('I am on the index page') do
  visit(todo_lists_path)
end

Given('I am logged in as {string} with password {string}') do |string, string2|
  visit(new_user_session_path)
  fill_in 'Email', with: string
  fill_in 'Password', with: string2
  click_on 'Log in'
end

# LOCATION ---------------------------------------------------------
Then('I should be on the index page') do
  expect(page.current_path).to eq(todo_lists_path).or eq('/')
end

Then('I should be on the create page of list {string}') do |list_name|
  expect(page.current_path).to eq(new_todo_list_todo_entry_path(TodoList.find_by(list_name:)))
end

# FIXME: THESE HAVE DEPENDENCIES ON A LIST
Then('I should be on the edit page for {string} of list {string}') do |name, list_name|
  expect(page.current_path).to eq(edit_todo_list_todo_entry_path(TodoList.find_by(list_name:),
                                                                 TodoEntry.find_by_name(name)))
end

Then('I should be on the show page for {string} of list {string}') do |name, list_name|
  expect(page.current_path).to eq(todo_list_todo_entry_path(TodoList.find_by(list_name:),
                                                            TodoEntry.find_by_name(name)))
end

Then('I should be on the share page for {string}') do |list_name|
  expect(page).to have_current_path(share_todo_list_path(TodoList.find_by(list_name:)))
  expect(page).to have_content(list_name)
end

Then('I should be on the sign-in page') do
  expect(page.current_path).to eq(new_user_session_path)
end

Then('I should be on the create page for a new list') do
  expect(page.current_path).to eq(new_todo_list_path)
end

Then('I should be on the edit page for the list {string}') do |list_name|
  expect(page.current_path).to eq(edit_todo_list_path(TodoList.find_by(list_name:)))
end

Then('I should be on the archived lists page') do
  expect(page.current_path).to eq(reactivate_todo_list_path(TodoList.all.where(archived: false).first))
end

# ACTIONS ----------------------------------------------------------

When('I login as {string} with password {string}') do |string, string2|
  visit(new_user_session_path)
  fill_in 'Email', with: string
  fill_in 'Password', with: string2
  click_on 'Log in'
end

When('I register as {string} with password {string}') do |string, string2|
  visit(new_user_session_path)
  click_on 'Sign up'
  fill_in 'Email', with: string
  fill_in 'Password', with: string2
  fill_in 'Password confirmation', with: string2
  click_on 'Sign up'
end

When('I click the {string} button for the task {string}') do |button_class, task|
  found = false
  found = true unless find('tr', text: task).find(".#{button_class}").click.nil?
  expect(found).to be(true)
end

When('I click the {string} button for the to-do list {string}') do |button_class, list|
  found = false
  found = true unless find('tr', text: list).find(".#{button_class}").click.nil?
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

When('I click {string}') do |string|
  find_link(id: string).click
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
  exists = (all('td.task_name').to_a + all('td.completed_task_name').to_a).any? { |td| td.text == string }
  expect(exists).to be(true)
end

Then('the task {string} should not exist') do |string|
  exists = (all('td.task_name').to_a + all('td.completed_task_name').to_a).any? { |td| td.text == string }
  expect(exists).to be(false)
end

Then('{string} should appear before {string}') do |string, string2|
  str_index = 0
  str2_index = 0

  all('td.task_name').each_with_index do |td, i|
    str_index = i if td.text == string
    str2_index = i if td.text == string2
  end
  # debugger

  correct_order = str_index < str2_index
  expect(correct_order).to be(true)
end

Then('I should see {string}') do |string|
  expect(page).to have_content(string)
end

Then('the current active list should be {string}') do |string|
  within('#active_list') do
    expect(page).to have_content(string)
  end
end

Then('{string} should be the currently active sorting function') do |string|
  find_link(class: 'active', id: string).should_not be_nil
end

Then('the current user should be {string}') do |string|
  within('#current_user') do
    expect(page).to have_content(string)
  end
end

Then('the list {string} should exist') do |string|
  within('#user_todo_lists') do
    expect(page).to have_content(string)
  end
end

Then('the list {string} should not exist') do |string|
  within('#user_todo_lists') do
    expect(page).to have_no_content(string)
  end
end

Then('the current active list should be empty') do
  expect((all('td.task_name').length + all('td.completed_task_name').length).zero?).to be(true)
end

Then('the flash message should be {string}') do |string|
  expect(page).to have_content(string)
end

Then('I should see {string} displayed on the page as an archived list') do |string|
  expect(all('td.list_name').any? { |entry| entry.text == string }).to be(true)
end

Then('the list {string} should not exist on the archived lists page') do |string|
  expect(all('td.list_name').any? { |entry| entry.text == string }).to be(false)
end
