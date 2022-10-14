require 'rails_helper'

RSpec.describe "todo_entries/new", type: :view do
  before(:each) do
    assign(:todo_entry, TodoEntry.new())
  end

  it "renders new todo_entry form" do
    render

    assert_select "form[action=?][method=?]", todo_entries_path, "post" do
    end
  end
end
