50.times do |n|
  c = Feature.create!(
    shop_show_id: n+1,
    daily: rand(0..1),
    guarantee: rand(0..1),
    carfare: rand(0..1),
    beginner: rand(0..1),
    experience: rand(0..1),
    menstruation: rand(0..1),
    dormitory: rand(0..1),
    room: rand(0..1),
    nursery: rand(0..1),
    pickup: rand(0..1),
    alibi: rand(0..1),
    home: rand(0..1),
  )
end