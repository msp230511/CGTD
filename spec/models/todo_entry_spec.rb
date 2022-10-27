# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodoEntry, type: :model do
  context 'the sorted_by method' do
    it 'should exist' do
      expect(TodoEntry).to respond_to(:sorted_by)
    end

    it 'should call the right underlying ActiveRecord method to do default sort' do
      expect(TodoEntry).to receive(:order).with(eq('name').or(eq(:name)))
      TodoEntry.sorted_by('name')
    end

    it 'should call the right underlying ActiveRecord method to sort by priority' do
      expect(TodoEntry).to receive(:order).with(eq('priority DESC'))
      TodoEntry.sorted_by('priority')
    end
    it 'should call the right underlying ActiveRecord method to sort by category' do
      expect(TodoEntry).to receive(:order).with(eq('category').or(eq(:category)))
      TodoEntry.sorted_by('category')
    end

    it 'should call the right underlying ActiveRecord method to sort by due date' do
      expect(TodoEntry).to receive(:order).with(eq('due_at').or(eq(:due_at)))
      TodoEntry.sorted_by('due_at')
    end

    it 'should handle the situation when a bogus sort column is given' do
      expect(TodoEntry).to receive(:order).with(eq('name').or(eq(:name)))
      TodoEntry.sorted_by('bogus_column')
    end

    it 'should handle the situation when a nil column name is given' do
      expect(TodoEntry).to receive(:order).with(eq('name').or(eq(:name)))
      TodoEntry.sorted_by(nil)
    end
  end
end
