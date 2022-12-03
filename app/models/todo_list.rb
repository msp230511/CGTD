# frozen_string_literal: true

class TodoList < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :todo_entries, dependent: :destroy
  validates :list_name, presence: true
end
