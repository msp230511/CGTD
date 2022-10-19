class TodoEntriesController < ApplicationController
    def index
        @todo_entries = TodoEntry.all
        order = params[:order] || 'name'
        @todo_entries = TodoEntry.sorted_by(order)
    end

    def new
      @todo_entry = TodoEntry.new
    end

    def edit
      @todo_entry = TodoEntry.find params[:id]
    end

    def update
      @todo_entry = TodoEntry.find params[:id]
      @todo_entry.update(check_params)
      flash[:notice] = "#{@todo_entry.name} was successfully updated."
      redirect_to todo_entry_path(@todo_entry)
    end

    def create
      td = TodoEntry.new(check_params)
      td.completed = false
      if td.save
        flash[:notice] = "New task #{td.name} created"
        redirect_to todo_entries_path
      else
        flash[:alert] = 'Failed to save new task'
        redirect_to new_todo_entry_path
      end
    end

    def show
        id = params[:id]
        @todo_entry = TodoEntry.all.find(id)
    end

    # private

    def check_params
      params.require(:todo_entry).permit(:name, :description, :priority, :category, :due_at, :completed)
    end
end
