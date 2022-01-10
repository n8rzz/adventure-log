puts ''
puts '=== JournalEntry'

owner = User.find_by(email: 'me@example.com')

rand(13..42).times do
  JournalEntry.create(
    body: Faker::Movies::StarWars.quote,
    entry_date: Faker::Date.between(from: 2.months.ago, to: Date.today),
    user: owner
  )

  print '.'
end

other_user = User.find_by(email: 'you@example.com')

rand(3..13).times do
  JournalEntry.create(
    body: Faker::Movies::StarWars.quote,
    entry_date: Faker::Date.between(from: 2.months.ago, to: Date.today),
    user: other_user
  )

  print '.'
end
