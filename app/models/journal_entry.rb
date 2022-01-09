class JournalEntry < ApplicationRecord
  belongs_to :user

  validates_presence_of :body, :entry_date
end
