require 'rails_helper'

RSpec.describe JournalEntry, type: :model do
  context 'has a valid factories' do
    it { expect(build(:journal_entry)).to be_instance_of(JournalEntry) }
  end

  describe 'data and associations' do
    it { should have_db_column(:body) }
    it { should have_db_column(:entry_date) }
  end

  before do
    @journal_entry = build(:journal_entry)
  end

  subject { @journal_entry }

  # describe 'validations' do
  #   it { should validate_presence_of(:email) }
  #   it { should validate_presence_of(:password) }
  # end
end
