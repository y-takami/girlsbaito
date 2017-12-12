20.times do |n|
  Apply.create!(
    girl_id: n+1,
    shop_show_id: rand(1..20),
    congratulation_money: rand(2000),
    employment: true,
    employment_day: Time.now-10.minutes,
    method: '電話',
    invitation_code: 1000000+n*100000
  )
end

20.times do |n|
  Apply.create!(
    girl_id: n+21,
    shop_show_id: rand(1..20),
    congratulation_money: rand(2000),
    method: '電話',
    invitation_code: 1000000+n*100000
  )
end
10.times do |n|
  Apply.create!(
    girl_id: n+41,
    shop_show_id: rand(1..20),
    congratulation_money: rand(2000),
    employment: false,
    method: '電話',
    invitation_code: 1000000+n*100000
  )
end