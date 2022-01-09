require 'rails_helper'

RSpec.describe "journal_entries/edit", type: :view do
  before(:each) do
    @journal_entry = assign(:journal_entry, JournalEntry.create!(
      body: "MyText",
      user: nil
    ))
  end

  it "renders the edit journal_entry form" do
    render

    assert_select "form[action=?][method=?]", journal_entry_path(@journal_entry), "post" do

      assert_select "textarea[name=?]", "journal_entry[body]"

      assert_select "input[name=?]", "journal_entry[user_id]"
    end
  end
end
