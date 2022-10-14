require 'rails_helper'

RSpec.describe "todo_entries/show", type: :view do
  before(:each) do
    assign(:todo_entry, TodoEntry.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
