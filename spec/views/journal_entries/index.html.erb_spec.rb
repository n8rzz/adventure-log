require 'rails_helper'

RSpec.describe "journal_entries/index", type: :view do
  let(:user) { create(:user) }

  before(:each) do
    assign(:journal_entries, create_list(:journal_entry))
  end

  it "renders a list of journal_entries" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
