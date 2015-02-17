Fabricator :user do
  full_name { Faker::Lorem.words(2).join }
  email { Faker::Internet.email }
  password 'password'
  password_confirmation 'password'
end