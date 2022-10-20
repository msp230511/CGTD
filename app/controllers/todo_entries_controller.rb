# frozen_string_literal: true

class TodoEntriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    order = params[:order] || 'name'
    @todo_entries = TodoEntry.all.sorted_by(order)
  end

  def new
    @todo_entry = TodoEntry.new
  end

  def show
    id = params[:id]
    @todo_entry = TodoEntry.find(id)
  end

  def edit
    @todo_entry = TodoEntry.find(params[:id])
  end

  def complete
    @todo_entry = TodoEntry.find(params[:id])
    @todo_entry.completed = true
    @todo_entry.save
    flash[:notice] = "Successfully Completed Task: #{@todo_entry.name}."
    redirect_to todo_entries_path
  end

  def undo_complete
    @todo_entry = TodoEntry.find(params[:id])
    @todo_entry.completed = false
    @todo_entry.save
    flash[:notice] = "Successfully Reactivated Task: #{@todo_entry.name}."
    redirect_to todo_entries_path
  end

  def update
    @todo_entry = TodoEntry.find(params[:id])
    @todo_entry.update(check_params)
    flash[:notice] = "Task: #{@todo_entry.name} : was successfully updated."
    redirect_to todo_entry_path(@todo_entry)
  end

  def create
    td = TodoEntry.new(check_params)
    # td = TodoEntry.new
    td.completed = false
    if td.save
      flash[:notice] = "New task #{td.name} created"
      redirect_to todo_entries_path
    else
      flash[:alert] = 'Failed to save new task'
      redirect_to new_todo_entry_path
    end
  end

  def delete
    @todo_entry = TodoEntry.find(params[:id])
    @todo_entry.destroy
    flash[:alert] = "Successfully Deleted Task: #{@todo_entry.name}"
    redirect_to todo_entries_path
  end

  private

  def record_not_found
    flash[:alert] = 'No such toy'
    redirect_to products_path
  end

  def check_params
    params.require(:todo_entry).permit(:name, :description, :priority, :category, :due_at, :completed)
  end
end
