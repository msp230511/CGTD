# frozen_string_literal: true

class TodoEntry < ApplicationRecord
  belongs_to :todo_list
  validates :name, presence: true

  def self.sorted_by(field)
    field = field.to_s.downcase

    return TodoEntry.order('priority DESC') if field == 'priority'
    return TodoEntry.order('due_at') if field == 'due_at'
    return TodoEntry.order('category') if field == 'category'

    TodoEntry.order(:name)
  end
end
