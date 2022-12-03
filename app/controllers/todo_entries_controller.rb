# frozen_string_literal: true

class TodoEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_active_todo_list # Make sure we have an active list to work with

  # def index
  #   redirect_to todo_lists_path
  #   # order = params[:order] || 'name'
  #   # @todo_entries = @active_list.todo_entries.all.sorted_by(order)
  #   # @active_tasks = @todo_entries.where(completed: false)
  #   # @completed_tasks = @todo_entries.where(completed: true)
  # end

  def show
    id = params[:id]
    @todo_entry = TodoEntry.find(id)
  end

  def edit
    @todo_entry = TodoEntry.find(params[:id])
  end

  def update
    @todo_entry = TodoEntry.find(params[:id])
    @todo_entry.update(check_params)
    flash[:notice] = "Task: #{@todo_entry.name} : was successfully updated."
    redirect_to todo_lists_path
  end

  def new
    @todo_entry = TodoEntry.new
  end

  def create
    td = @active_list.todo_entries.new(check_params)
    td.completed = false
    # td.todo_list_id = @active_list
    if td.save
      flash[:notice] = "New task #{td.name} created"
      redirect_to todo_lists_path
    else
      flash[:alert] = 'Failed to save new task. Please check your arguments'
      flash[:alert] = 'Failed to save new task. Task name cannot be nil.' if td.name == ''
      redirect_to new_todo_list_todo_entry_path(@active_list)
    end
  end

  def destroy
    @todo_entry = TodoEntry.find(params[:id])
    @todo_entry.destroy
    flash[:alert] = "Successfully Deleted Task: #{@todo_entry.name}"
    redirect_to todo_lists_path
  end

  def complete
    @todo_entry = TodoEntry.find(params[:id])
    @todo_entry.completed = true
    @todo_entry.save
    flash[:notice] = "Successfully Completed Task: #{@todo_entry.name}."
    redirect_to todo_lists_path
  end

  def undo_complete
    @todo_entry = TodoEntry.find(params[:id])
    @todo_entry.completed = false
    @todo_entry.save
    flash[:notice] = "Successfully Reactivated Task: #{@todo_entry.name}."
    redirect_to todo_lists_path
  end

  private

  def set_active_todo_list
    # @active_list = current_user.todo_lists.find(params[:todo_list_id])
    # Find the todo list for the given id and the current user
    @active_list = current_user.todo_lists.includes(:todo_entries).find_by(id: params[:todo_list_id])
  end

  def check_params
    params.require(:todo_entry).permit(:name, :description, :priority, :category, :due_at, :completed)
  end
end
