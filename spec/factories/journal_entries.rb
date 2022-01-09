FactoryBot.define do
  factory :journal_entry do
    body { Faker::Movies::StarWars.quote }
    entry_date { DateTime.now() }

    user
  end
end
