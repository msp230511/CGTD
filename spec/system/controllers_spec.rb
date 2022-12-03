# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Controllers', type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    @user = User.create!(email: 'user@colgate.edu', password: 'colgate13')
  end

  describe 'create new todo entry' do
    it 'should handle failure correctly' do
      login_as(@user, scope: :user)
      a = TodoList.create!(list_name: 'Test1')
      @user.todo_lists << a
      b = TodoEntry.new
      allow(TodoEntry).to receive(:new).and_return(b)
      allow(b).to receive(:save).and_return(nil)
      visit new_todo_list_todo_entry_path(a)
      fill_in 'Name', with: 'TEST'
      click_on 'Create'
      expect(page.current_path).to eq(new_todo_list_todo_entry_path(a))
      expect(page.text).to match(/Failed to save new task/)
      logout(:user)
    end
  end

  describe 'create new todo list' do
    it 'should handle failure correctly' do
      login_as(@user, scope: :user)
      a = TodoList.new
      allow(TodoList).to receive(:new).and_return(a)
      allow(a).to receive(:save).and_return(nil)
      visit new_todo_list_path
      fill_in 'List name', with: 'TEST'
      click_on 'Create'
      expect(page.current_path).to eq(new_todo_list_path(a))
      expect(page.text).to match(/Failed to save new list/)
      logout(:user)
    end
  end
end
