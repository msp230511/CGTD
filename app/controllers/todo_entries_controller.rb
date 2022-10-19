class TodoEntriesController < ApplicationController
    def index
        @todo_entries = TodoEntry.all
        order = params[:order] || 'name'
        @todo_entries = TodoEntry.sorted_by(order)
    end

    def new
      @todo_entry = TodoEntry.new
    end

    def create
      # td = TodoEntry.new(check_params)
      td = TodoEntry.new
      td.completed = false
      puts params
      puts "AFTER PARAMS"
      if td.save
        flash[:notice] = "New task #{td.name} created"
        redirect_to todo_entries_path
      else
        flash[:alert] = 'Failed to save new task'
        redirect_to new_todo_entry_path
      end
<<<<<<< HEAD

    def show
        @todo_entries = TodoEntry.all
        id = params[:id]
        @todo_entries = TodoEntry.find(id)
    end
=======
    end

    # private

    # def check_params
    #   params.require(:todo_entry).permit(:name, :description, :priority, :category, :due_at, :completed)
    # end
>>>>>>> afba47b0480d1f5b0a249c8e88557f6dfd206eba
end
