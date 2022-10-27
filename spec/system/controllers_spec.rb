# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Controllers', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'create new todo entry' do
    it 'should handle failure correctly' do
      b = TodoEntry.new
      allow(TodoEntry).to receive(:new).and_return(b)
      allow(b).to receive(:save).and_return(nil)
      visit new_todo_entry_path
      fill_in 'Name', with: 'TEST'
      click_on 'Create'
      expect(page.current_path).to eq(new_todo_entry_path)
      expect(page.text).to match(/Failed to save new task/)
    end
  end
end
