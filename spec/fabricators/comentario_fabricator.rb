Fabricator :comentario do
  comentario { Faker::Lorem.paragraph(3) }
  comentable_type { "Vino" }
  comentable_id { (1..100).to_a.sample }
end