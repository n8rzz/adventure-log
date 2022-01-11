puts ''
puts '=== JournalEntry'

owner = User.find_by(email: 'me@example.com')

rand(13..23).times do
  JournalEntry.create(
    body: Faker::Movies::StarWars.quote,
    entry_date: Faker::Date.between(from: 2.months.ago, to: Date.today),
    user: owner
  )

  print '.'
end

rand(7..32).times do
  JournalEntry.create(
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consequat interdum varius sit amet mattis vulputate enim nulla. Purus sit amet luctus venenatis lectus magna fringilla. Faucibus vitae aliquet nec ullamcorper sit amet. Orci nulla pellentesque dignissim enim. Velit dignissim sodales ut eu sem integer vitae justo. Erat velit scelerisque in dictum non. Eget felis eget nunc lobortis mattis aliquam faucibus. Etiam erat velit scelerisque in dictum. Elementum nibh tellus molestie nunc non blandit massa enim nec. Orci dapibus ultrices in iaculis nunc sed. Dictum non consectetur a erat.

      Dignissim convallis aenean et tortor at. Velit laoreet id donec ultrices tincidunt. Nam at lectus urna duis convallis. Sed sed risus pretium quam vulputate dignissim suspendisse in. Pretium lectus quam id leo. Quis enim lobortis scelerisque fermentum dui faucibus in ornare. Dignissim suspendisse in est ante. Amet justo donec enim diam vulputate ut. Maecenas ultricies mi eget mauris pharetra et. Quis auctor elit sed vulputate mi. Lectus arcu bibendum at varius vel pharetra vel. Enim nunc faucibus a pellentesque sit amet.",
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
