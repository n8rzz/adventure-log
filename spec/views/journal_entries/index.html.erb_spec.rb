require 'rails_helper'

RSpec.describe "journal_entries/index", type: :view do
  before(:each) do
    assign(:journal_entries, [
      JournalEntry.create!(
        body: "MyText",
        user: nil
      ),
      JournalEntry.create!(
        body: "MyText",
        user: nil
      )
    ])
  end

  it "renders a list of journal_entries" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
