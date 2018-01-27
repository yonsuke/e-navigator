# ユーザー
5.times do |n|
  email = "#{n + 1}@example.com"
  password = "password"
  name  = "ユーザー#{n + 1}"
  birthdate = "199#{n}-10-2#{n}"
  gender = n % 2
  school = "第#{n + 1}大学"
  User.create!(email: email,
               password: password,
               name: name,
               birthdate: birthdate,
               gender: gender,
               school: school)
end

# インタビュー
users = User.all
6.times do |n|
  start_time = "2018-02-1#{n} 1#{n}:2#{n}:00"
  users.each { |user| user.interviews.create!(start_time: start_time,
                                              user_id: user.id) }
end
