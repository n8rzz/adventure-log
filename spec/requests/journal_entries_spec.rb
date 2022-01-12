 require 'rails_helper'

RSpec.describe "/journal_entries", type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) { attributes_for(:journal_entry, user_id: user.id) }
  let(:invalid_attributes) { attributes_for(:journal_entry, entry_date: nil, user_id: user.id) }

  before do
    login_as user, scope: :user
  end

  after do
    logout user
  end

  describe "GET /index" do
    it "renders a successful response" do
      JournalEntry.create! valid_attributes
      get journal_entries_url

      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      journal_entry = JournalEntry.create! valid_attributes
      get journal_entry_url(journal_entry)

      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_journal_entry_url

      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      journal_entry = JournalEntry.create! valid_attributes
      get edit_journal_entry_url(journal_entry)

      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new JournalEntry" do
        expect {
          post journal_entries_url, params: { journal_entry: valid_attributes }
        }.to change(JournalEntry, :count).by(1)
      end

      it "redirects to the created journal_entry" do
        post journal_entries_url, params: { journal_entry: valid_attributes }

        expect(response).to redirect_to(journal_entry_url(JournalEntry.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new JournalEntry" do
        expect {
          post journal_entries_url, params: { journal_entry: invalid_attributes }
        }.to change(JournalEntry, :count).by(0)
      end

      # it "renders a successful response (i.e. to display the 'new' template)" do
      #   post journal_entries_url, params: { journal_entry: invalid_attributes }

      #   expect(response).to be_successful
      # end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { attributes_for(:journal_entry, body: Faker::Movies::Lebowski.quote, user_id: user.id) }

      it "updates the requested journal_entry" do
        # FIXME: get this test working!

        # journal_entry = JournalEntry.create! valid_attributes
        # patch journal_entry_url(journal_entry), params: { journal_entry: new_attributes }
        # journal_entry.reload

        # expect(response.body).to include(new_attributes.body)
      end

      it "redirects to the journal_entry" do
        journal_entry = JournalEntry.create! valid_attributes
        patch journal_entry_url(journal_entry), params: { journal_entry: new_attributes }
        journal_entry.reload

        expect(response).to redirect_to(journal_entry_url(journal_entry))
      end
    end


    context "with invalid parameters" do
      # FIXME: get this test working!
    #   it "renders a successful response (i.e. to display the 'edit' template)" do
    #     journal_entry = JournalEntry.create! valid_attributes
    #     patch journal_entry_url(journal_entry), params: { journal_entry: invalid_attributes }

    #     expect(response).to be_successful
    #   end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested journal_entry" do
      journal_entry = JournalEntry.create! valid_attributes
      expect {
        delete journal_entry_url(journal_entry)
      }.to change(JournalEntry, :count).by(-1)
    end

    it "redirects to the journal_entries list" do
      journal_entry = JournalEntry.create! valid_attributes
      delete journal_entry_url(journal_entry)

      expect(response).to redirect_to(journal_entries_url)
    end
  end
end
