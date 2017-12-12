50.times do |n|
  Point.create!(
    girl_id: rand(1..20),
    congratulation_id: rand(1..20),
    amount: 5000
  )
end
