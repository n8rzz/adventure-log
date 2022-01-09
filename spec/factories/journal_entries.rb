FactoryBot.define do
  factory :journal_entry do
    body { Faker::Games::Myst.quote }
    entry_date { DateTime.now() }

    user
  end
end
