puts '=== Users'

password = 's@f3wo4d'

admin = User.create(
  email: 'me@example.com',
  name: Faker::Movies::Lebowski.character,
  password: password,
  password_confirmation: password,
  provider: 'google_oauth2',
  uid: '123456789'
)

print '.'

manualUser = User.create(
  email: 'you@example.com',
  name: Faker::Movies::Lebowski.character,
  password: password,
  password_confirmation: password,
  provider: 'google_oauth2',
  uid: '2345678910'
)

print '.'
