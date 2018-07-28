0.times do |n|
Congratulation.create!(
  apply_id: rand(1..10),
  email: 'congratulation@email.com',
  method: '銀行振込',
  bank_name: 'UFJ',
  bank_branch_name: 'kawa',
  bank_number: '777',
  bank_type: '普通',
  interview: Time.now,
  first_work_day: Time.now,
  first_work_flag: true,
  policy: true,
  examine: true
  )
end
0.times do |n|
Congratulation.create!(
    apply_id: rand(11..20),
    email: 'congratulation@email.com',
    method: '銀行振込',
    bank_name: 'UFJ',
    bank_branch_name: 'kawa',
    bank_number: '777',
    bank_type: '普通',
    interview: Time.now,
    first_work_day: Time.now,
    first_work_flag: true,
    policy: true
  )
end