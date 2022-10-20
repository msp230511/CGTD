# frozen_string_literal: true

class TodoEntry < ApplicationRecord
  #   t.string :name
  #   t.text :description
  #   t.string :priority
  #   t.string :category
  #   t.date :due_at
  #   t.boolean :completed, null: false

  def self.sorted_by(field)
    field = field.to_s.downcase

    return TodoEntry.order('priority DESC') if field == 'priority'
    return TodoEntry.order('due_at') if field == 'due date'
    return TodoEntry.order('category') if field == 'category'

    TodoEntry.order(:name)
  end
end
