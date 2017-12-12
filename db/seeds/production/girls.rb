50.times do |n|
Girl.create!(
    nickname: 'ゆーこ',
    name: "小倉優子#{n}",
    email: "girl#{n}@email.com",
    password: 'password',
    password_confirmation: 'password',
    line_id: 'yuko',
    invitation_code: 1000000+n*200000,
    invitation_point: 10000
  )

end