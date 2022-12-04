# frozen_string_literal: true

class TodoListsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Load all lists and entry data for a given user, create an initial todo list if it is a new user
    @todo_lists = load_todo_data.all.order(created_at: :asc)
    if @todo_lists.length.zero? || @todo_lists.where(archived: false).length.zero?
      list1 = TodoList.create(list_name: 'Default List')
      current_user.todo_lists << list1
      # TodoList.create!(list_name: 'List2', user_id: current_user.id)
      @todo_lists = load_todo_data.all.order(created_at: :asc)
    end

    # Set active list
    @active_list = @todo_lists.find_by(id: params[:active_list]) || @todo_lists.find_by(id: session[:active_list]) || @todo_lists.where(archived: false).first
    session[:active_list] = @active_list.id unless params[:active_list].nil?
    @non_active_lists = @todo_lists.where('id != ?', @active_list.id).where(archived: false)

    # Pull todo entries for this list
    order = params[:order] || session[:order] || 'name'
    session[:order] = order unless params[:order].nil?
    @todo_entries = @active_list.todo_entries.all.sorted_by(order)
    @active_tasks = @todo_entries.where(completed: false)
    @completed_tasks = @todo_entries.where(completed: true)

    # Set CSS classes for sort formatting
    @sort_hash = {}
    %w[name priority due_at category].each do |sort|
      @sort_hash[sort] = session[:order] == sort ? 'btn btn-secondary active' : 'btn btn-secondary'
    end

    # Get List of Users
    @user_list = User.all
  end

  def new
    @todo_list = TodoList.new
  end

  def create
    list = TodoList.new(check_params)
    if list.save
      current_user.todo_lists << list
      flash[:notice] = "New list #{list.list_name} created"
      redirect_to todo_lists_path
    else
      flash[:alert] = 'Failed to save new list. Please check your arguments!'
      # flash[:alert] = 'Failed to save new list. List name cannot be nil.' if list.list_name == ''
      redirect_to new_todo_list_path
    end
  end

  def update
    @todo_list = TodoList.find(params[:id])
    list_name = @todo_list.list_name
    if @todo_list.update(check_params)
      flash[:notice] = "List: #{list_name} was successfully updated to be #{@todo_list.list_name}."
      redirect_to todo_lists_path
    else
      flash[:alert] = "List: #{list_name} : could not be updated. Please check your arguments!"
      redirect_to edit_todo_list_path(@todo_list)
    end
  end

  def edit
    @todo_list = TodoList.find(params[:id])
  end

  def destroy
    @todo_list = TodoList.find(params[:id])
    @todo_list.destroy
    flash[:alert] = "Successfully Deleted List: #{@todo_list.list_name}"

    if params[:archived_page]
      redirect_to reactivate_todo_list_path(TodoList.find_by(id: session[:active_list]))
    else
      redirect_to todo_lists_path
    end
  end

  def share
    # Load the active todo list
    @active_list = TodoList.find(params[:id])
    render 'share'
  end

  def share_list
    @active_list = TodoList.find(params[:id])
    @user = User.find_by(email: params[:user_email])

    # Add the user to the list of users who have access to the todo list
    if @user && !@active_list.users.include?(@user)
      @active_list.users << @user
      flash[:notice] = "Successfully shared list: #{@active_list.list_name} with user: #{@user.email}"
    elsif @user && @active_list.users.include?(@user)
      flash[:alert] = "List: #{@active_list.list_name} is already shared with user: #{@user.email}"
    else
      flash[:alert] = "Could not find user with email: #{params[:user_email]}"
    end

    redirect_to todo_lists_path
  end

  def archive
    # Find the todo list to be archived
    @todo_list = TodoList.find(params[:id])

    # Set the 'archived' field to true
    @todo_list.update(archived: true)
    session[:active_list] = load_todo_data.where('id != ?', @todo_list.id).where(archived: false).first&.id || nil

    # Redirect to the list of todo lists with a success message
    redirect_to todo_lists_path, notice: "List #{@todo_list.list_name} has been archived."
  end

  def reactivate
    @active_list = TodoList.find(params[:id])
    session[:active_list] = @active_list.id
    @archived_lists = load_todo_data.where('id != ?', @active_list.id).where(archived: true)
    @non_active_lists = load_todo_data.where('id != ?', @active_list.id).where(archived: false)
    render 'reactivate'
  end

  def unarchive
    # Find the todo list to be reactivated
    @todo_list = TodoList.find(params[:id])
    # Set the 'archived' field to false
    @todo_list.update(archived: false)
    session[:active_list] = @todo_list.id || nil

    # Redirect to the list of todo lists with a success message
    redirect_to todo_lists_path, notice: "List #{@todo_list.list_name} has been reactivated." and return
  end

  private

  def load_todo_data
    current_user.todo_lists.includes(:todo_entries)
  end

  def check_params
    params.require(:todo_list).permit(:list_name)
  end
end
