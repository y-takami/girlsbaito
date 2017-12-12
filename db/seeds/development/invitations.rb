25.times do |n|
  Invitation.create!(
    girl_id: rand(1..10),
    method: '銀行振込',
    application_amount: 5000,
    name: '山田太郎',
    name_sei_kana: 'ヤマダ',
    name_mei_kana: 'タロウ',
    email: "invitation@email.com",
    tel: '09012345678',
    postal_first: '111',
    postal_last: '1111',

  )
end