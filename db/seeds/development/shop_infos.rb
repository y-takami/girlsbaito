30.times do |n|
  c = ShopInfo.create!(
    group_number: '1',
    shop_name: "統括会社#{n}",
    url: 'example.com',
    admin_name: '山田太郎',
    admin_name_sei: 'ヤマダ',
    admin_name_mei: 'タロウ',
    admin_email: "shop#{n}@email.com",
    admin_tel: '09012345678',
    manager_name: '山田花子',
    manager_name_sei: 'ヤマダ',
    manager_name_mei: 'ハナコ',
    manager_email: "manager#{n}@email.com",
    postal_first: '111',
    postal_last: '1111',
    prefecture: '東京都',
    city: '中央区',
    house_number: '8',
    password: 'password',
    password_confirmation: 'password',
    suspended: false,
    examine: true

  )
  c.shop_shows.create!(
    shop_name: "女子バイト#{n}",
    url: "baito.com",
    prefecture_id: rand(1..5),
    city_id: rand(1..20),
    house_number: '秋葉原',
    payment_hour_high: rand(10000..50000),
    payment_hour_low: rand(820..2000),
    payment_day: '5万',
    category_id: rand(1..8),
    message: '来てね',
    line_id: 'shop',
    note: 'note',
    route_id: rand(11101..11119),
    station_id: rand(1110101..1110135),
    title: 'こんばんは，ようこそ',
    summary: 'ようやくだよー',
    job_content: '仕事内容だよー',
    congratulation_money: '100000',
    stop_flag: false,
    examine: true,
    :license => open('images/image3.jpg'),
    :main_image => open('images/main.jpg'),
    :image1 => open('images/image1.jpg'),
    :image2 => open('images/image2.jpg'),
    :image3 => open('images/image3.jpg')
  )
end
10.times do |n|
  c = ShopInfo.create!(
    group_number: '1',
    shop_name: "統括会社#{n+200}",
    url: 'example.com',
    admin_name: '山田太郎',
    admin_name_sei: 'ヤマダ',
    admin_name_mei: 'タロウ',
    admin_email: "shop#{n+200}@email.com",
    admin_tel: '09012345678',
    manager_name: '山田花子',
    manager_name_sei: 'ヤマダ',
    manager_name_mei: 'ハナコ',
    manager_email: "manager#{n+200}@email.com",
    postal_first: '111',
    postal_last: '1111',
    prefecture: '東京都',
    city: '中央区',
    house_number: '8',
    password: 'password',
    password_confirmation: 'password',
    suspended: false,
    examine: false

  )
  c.shop_shows.create!(
    shop_name: "女子バイト#{n+200}",
    url: "baito.com",
    prefecture_id: rand(1..5),
    city_id: rand(1..20),
    house_number: '秋葉原',
    payment_hour_high: rand(10000..50000),
    payment_hour_low: rand(820..2000),
    payment_day: '5万',
    category_id: rand(1..8),
    message: '来てね',
    line_id: 'shop',
    note: 'note',
    route_id: rand(11101..11119),
    station_id: rand(1110101..1110135),
    title: 'こんばんは，ようこそ',
    summary: 'ようやくだよー',
    job_content: '仕事内容だよー',
    congratulation_money: '100000',
    stop_flag: false,
    examine: false,
    :license => open('images/image3.jpg'),
    :main_image => open('images/main.jpg'),
    :image1 => open('images/image1.jpg'),
    :image2 => open('images/image2.jpg'),
    :image3 => open('images/image3.jpg')
  )
end