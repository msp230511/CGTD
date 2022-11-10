# frozen_string_literal: true

class TodoListsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Load all lists and entry data for a given user, create an initial todo list if it is a new user
    @todo_lists = load_todo_data.all.order(created_at: :asc)
    if @todo_lists.length.zero?
      TodoList.create!(list_name: 'List1', user_id: current_user.id)
      TodoList.create!(list_name: 'List2', user_id: current_user.id)
      @todo_lists = load_todo_data.all.order(created_at: :asc)
    end

    # Set active list
    @active_list = @todo_lists.find_by(id: params[:active_list]) || @todo_lists.find_by(id: session[:active_list]) || @todo_lists.first
    session[:active_list] = @active_list.id unless params[:active_list].nil?
    @non_active_lists = @todo_lists.where('id != ?', @active_list.id)

    # Pull todo entries for this list
    order = params[:order] || session[:order] || 'name'
    session[:order] = order unless params[:order].nil?
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
    list = TodoList.new(check_params)
    list.user_id = current_user.id
    if list.save
      flash[:notice] = "New list #{list.list_name} created"
      redirect_to todo_lists_path
    else
      flash[:alert] = 'Failed to save new list. Please check your arguments'
      flash[:alert] = 'Failed to save new list. List name cannot be nil.' if list.list_name == ''
      redirect_to new_todo_list_path
    end
  end

  def update
    @todo_list = TodoList.find(params[:id])
    @todo_list.update(check_params)
    flash[:notice] = "List: #{@todo_list.name} : was successfully updated."
    redirect_to todo_lists_path
  end

  def delete
    @todo_list = TodoList.find(params[:id])
    @todo_list.destroy
    flash[:alert] = "Successfully Deleted List: #{@todo_list.list_name}"
    redirect_to todo_lists_path
  end

  private

  def load_todo_data
    current_user.todo_lists.includes(:todo_entries)
  end

  def check_params
    params.require(:todo_list).permit(:list_name)
  end
end
