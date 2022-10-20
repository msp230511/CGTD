# frozen_string_literal: true

class CreateTodoEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_entries do |t|
      # t.references :user
      t.string :name
      t.text :description
      t.integer :priority
      t.string :category
      t.datetime :due_at
      t.boolean :completed, null: false

      t.timestamps
    end
  end
end
