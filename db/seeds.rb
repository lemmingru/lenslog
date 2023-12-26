# Crate a main sample user
User.create!(name: 'Admin',
             email: 'admin@example.com',
             password: '12345678',
             password_confirmation: '12345678',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: 'Иван Иванов',
             email: 'ivanov@example.com',
             password: '12345678',
             password_confirmation: '12345678',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

10.times do |_n|
  name = Faker::Internet.username
  email = Faker::Internet.email(name: name, separators: ['-'], domain: 'example.com')
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

LensType.create(user: User.find(1), manufacturer: 'Acuvue Oasis', prescription: '-1.75', wearing_period: 14)
LensType.create(user: User.find(1), manufacturer: 'Acuvue Oasis', prescription: '-2.0', wearing_period: 14)
LensType.create(user: User.find(2), manufacturer: 'Acuvue Oasis', prescription: '-2.5', wearing_period: 14)
LensType.create(user: User.find(1), manufacturer: 'B&L', prescription: '-1.75', wearing_period: 1)
LensType.create(user: User.find(2), manufacturer: 'B&L', prescription: '-2.0', wearing_period: 1)

puts 'Five LensTypes created successfully.'

# Создаем четыре линзы
Lens.create(status: 'Active', usage_days: 10, lens_type: LensType.find(1))
Lens.create(status: 'Active', usage_days: 10, lens_type: LensType.find(1))
Lens.create(status: 'Active', usage_days: 1, lens_type: LensType.find(4))
Lens.create(status: 'Active', usage_days: 1, lens_type: LensType.find(4))

puts 'Four Lenses created successfully.'
