class CreateTodoListsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :todo_lists, :users do |t|
      t.index [:todo_list_id, :user_id]
      t.index [:user_id, :todo_list_id]
    end
  end
end
