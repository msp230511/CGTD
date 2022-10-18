class TodoEntriesController < ApplicationController
    def index
        @todo_entries = TodoEntry.all
        order = params[:order] || 'name'
        @todo_entries = TodoEntry.sorted_by(order)
      end
end
