require 'rails_helper'

RSpec.describe "journal_entries/index", type: :view do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  before do
    login_as user, scope: :user
  end

  before(:each) do
    assign(:journal_entries, [
      assign(:journal_entry, body: 'First Entry', user_id: user.id),
      assign(:journal_entry, body: 'Second Entry', user_id: user.id),
    ])
  end

  it "renders a list of journal_entries" do
    render

    expect(rendered).to match(/First Entry/)
    expect(rendered).to match(/Second Entry/)
  end
end
