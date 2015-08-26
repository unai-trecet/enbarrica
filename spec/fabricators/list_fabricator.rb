Fabricator :list do
  nombre { Faker::Lorem.words(2).join } 
  user_id { (1..100).to_a.sample }
end