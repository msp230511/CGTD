class TodoEntriesController < ApplicationController
  before_action :set_todo_entry, only: %i[ show edit update destroy ]

  # GET /todo_entries or /todo_entries.json
  def index
    @todo_entries = TodoEntry.all
  end

  # GET /todo_entries/1 or /todo_entries/1.json
  def show
  end

  # GET /todo_entries/new
  def new
    @todo_entry = TodoEntry.new
  end

  # GET /todo_entries/1/edit
  def edit
  end

  # POST /todo_entries or /todo_entries.json
  def create
    @todo_entry = TodoEntry.new(todo_entry_params)

    respond_to do |format|
      if @todo_entry.save
        format.html { redirect_to todo_entry_url(@todo_entry), notice: "Todo entry was successfully created." }
        format.json { render :show, status: :created, location: @todo_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_entries/1 or /todo_entries/1.json
  def update
    respond_to do |format|
      if @todo_entry.update(todo_entry_params)
        format.html { redirect_to todo_entry_url(@todo_entry), notice: "Todo entry was successfully updated." }
        format.json { render :show, status: :ok, location: @todo_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_entries/1 or /todo_entries/1.json
  def destroy
    @todo_entry.destroy

    respond_to do |format|
      format.html { redirect_to todo_entries_url, notice: "Todo entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_entry
      @todo_entry = TodoEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_entry_params
      params.fetch(:todo_entry, {})
    end
end
