require 'rails_helper'

RSpec.describe "todo_entries/index", type: :view do
  before(:each) do
    assign(:todo_entries, [
      TodoEntry.create!(),
      TodoEntry.create!()
    ])
  end

  it "renders a list of todo_entries" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
