puts '=== Users'

password = 's@f3wo4d'

# This use belongs to a group
admin = User.create(
  email: 'me@example.com',
  name: 'adventure admin',
  password: password,
  password_confirmation: password,
  provider: 'google_oauth2',
  uid: '123456789'
)

print '.'
