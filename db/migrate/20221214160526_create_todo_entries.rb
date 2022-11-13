# frozen_string_literal: true

class CreateTodoEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_entries do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.string :category
      t.date :due_at
      t.boolean :completed, null: false
      t.references :todo_list, foreign_key: { to_table: :todo_lists }
      t.timestamps
    end
  end
end
