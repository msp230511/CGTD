class TodoList < ApplicationRecord
    belongs_to :user
    has_many :todo_entry
end
