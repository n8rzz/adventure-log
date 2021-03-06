require 'rails_helper'

RSpec.describe User, type: :model do
  context 'has a valid factories' do
    it { expect(build(:user)).to be_instance_of(User) }
    it { expect(build(:user, email: nil)).to_not be_valid }
  end

  describe 'data and associations' do
    it { should have_db_column(:name) }
    it { should have_db_column(:email) }
    it { should have_db_column(:encrypted_password) }
    it { should have_db_column(:reset_password_token) }
    it { should have_db_column(:reset_password_sent_at) }
    it { should have_db_column(:remember_created_at) }
    it { should have_db_column(:sign_in_count).with_options(default: 0) }
    it { should have_db_column(:current_sign_in_at) }
    it { should have_db_column(:last_sign_in_at) }
    it { should have_db_column(:current_sign_in_ip) }
    it { should have_db_column(:last_sign_in_ip) }
    it { should have_db_index(:email) }
    it { should have_db_index(:reset_password_token) }
    it { should have_many(:journal_entries) }
  end

  before do
    @user = build(:user)
  end

  subject { @user }

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
end
