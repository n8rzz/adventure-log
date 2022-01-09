require 'rails_helper'

RSpec.describe "journal_entries/edit", type: :view do
  let(:user) { create(:user) }

  before(:each) do
    @journal_entry =build(:journal_entry)
  end

  it "renders the edit journal_entry form" do
    render

    assert_select "form[action=?][method=?]", journal_entry_path(@journal_entry), "post" do
      assert_select "textarea[name=?]", "journal_entry[body]"
      assert_select "input[name=?]", "journal_entry[user_id]"
    end
  end
end
