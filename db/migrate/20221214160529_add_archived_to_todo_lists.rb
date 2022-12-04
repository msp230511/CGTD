# frozen_string_literal: true

class AddArchivedToTodoLists < ActiveRecord::Migration[7.0]
  def change
    add_column :todo_lists, :archived, :boolean, default: false
  end
end
