10.times do |n|
Girl.create!(
    nickname: 'はなこ',
    name: "小倉優子#{n}",
    email: "girl#{n}@email.com",
    password: 'password',
    line_id: 'hanako',
    invitation_code: 1000000+n*200000,
    invitation_point: 10000
  )

end