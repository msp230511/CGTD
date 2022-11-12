# frozen_string_literal: true

class TodoList < ApplicationRecord
  belongs_to :user
  has_many :todo_entries, dependent: :destroy
  validates :list_name, presence: true
end
