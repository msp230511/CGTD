# frozen_string_literal: true

class CreateTodoLists < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_lists do |t|
      # t.references :user, foreign_key: { to_table: :users }
      t.string :list_name
      t.timestamps
    end
  end
end
