class TodoListsController < ApplicationController
    before_action :authenticate_user!

    def index

        # Load all lists and entry data for a given user, create an initial todo list if it is a new user
        @todo_lists = load_todo_data.all.order(created_at: :asc)
        if @todo_lists.length == 0
            TodoList.create!(:list_name => "List1", :user_id => current_user.id)
            @todo_lists = load_todo_data.all.order(created_at: :asc)
        end

        # Set active list
        @active_list = @todo_lists.find_by(id: params[:active_list]) || @todo_lists.first

        # Pull todo entries for this list
        order = params[:order] || 'name'
        @todo_entries = @active_list.todo_entries.all.sorted_by(order)
        @active_tasks = @todo_entries.where(completed: false)
        @completed_tasks = @todo_entries.where(completed: true)

        # Get List of Users
        @user_list = User.all
    end

    def new
        @todo_list = TodoList.new
    end

    def create
    end

    def update
    end

    def delete
    end

    private 
    
    def load_todo_data
        current_user.todo_lists.includes(:todo_entries)
    end

end
