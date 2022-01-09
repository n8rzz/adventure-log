FactoryBot.define do
  factory :journal_entry do
    body { "MyText" }
    entry_date { Date.now }
    user { nil }
  end
end
