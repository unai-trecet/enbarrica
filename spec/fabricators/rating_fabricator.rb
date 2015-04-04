Fabricator :rating do
  valoracion { (1..10).to_a.sample } 
  vino_id { (1..100).to_a.sample } 
  user_id { (1..100).to_a.sample } 
end