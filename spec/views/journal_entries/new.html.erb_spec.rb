require 'rails_helper'

RSpec.describe "journal_entries/new", type: :view do
  before(:each) do
    assign(:journal_entry, JournalEntry.new(
      body: "MyText",
      user: nil
    ))
  end

  it "renders new journal_entry form" do
    render

    assert_select "form[action=?][method=?]", journal_entries_path, "post" do

      assert_select "textarea[name=?]", "journal_entry[body]"

      assert_select "input[name=?]", "journal_entry[user_id]"
    end
  end
end
