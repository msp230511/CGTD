require 'rails_helper'

RSpec.describe "todo_entries/edit", type: :view do
  let(:todo_entry) {
    TodoEntry.create!()
  }

  before(:each) do
    assign(:todo_entry, todo_entry)
  end

  it "renders the edit todo_entry form" do
    render

    assert_select "form[action=?][method=?]", todo_entry_path(todo_entry), "post" do
    end
  end
end
