require 'rails_helper'

RSpec.describe "journal_entries/show", type: :view do
  let(:user) { create(:user) }

  before(:each) do
    @journal_entry = create(:journal_entry, body: 'journal entry body', user: user)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/journal entry body/)
  end
end
