# frozen_string_literal: true

class CreateTodoListsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :todo_lists, :users do |t|
      t.index %i[todo_list_id user_id]
      t.index %i[user_id todo_list_id]
    end
  end
end
