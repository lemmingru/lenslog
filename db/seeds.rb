
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

# 10.times do |_n|
#   name = Faker::Internet.username
#   email = Faker::Internet.email(name: name, separators: ['-'], domain: 'example.com')
#   password = 'password'
#   User.create!(name: name,
#                email: email,
#                password: password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now)
# end

LensType.create(user: User.find(1), manufacturer: 'Acuvue Oasis', prescription: '-1.75', wearing_period: 14)
LensType.create(user: User.find(1), manufacturer: 'Acuvue Oasis', prescription: '-2.0', wearing_period: 14)
LensType.create(user: User.find(2), manufacturer: 'Acuvue Oasis', prescription: '-2.5', wearing_period: 14)
LensType.create(user: User.find(1), manufacturer: "B&L", prescription: '-1.75', wearing_period: 2)
LensType.create(user: User.find(2), manufacturer: "B$L", prescription: '-2.0', wearing_period: 2)

puts 'Создали типы линз'

# Создаем четыре линзы
Lens.create(status: 'Active', usage_hours: 4, last_usage_date: '2024-01-01', lens_type: LensType.find(1))
Lens.create(status: 'Active', usage_hours: 0, lens_type: LensType.find(2))
Lens.create(status: 'Active', usage_hours: 5, last_usage_date: '2024-01-01', lens_type: LensType.find(3))
Lens.create(status: 'Active', usage_hours: 1, lens_type: LensType.find(4))

puts 'Создали линзы'

Usage.create(lens: Lens.find(1), usage_hours: 24, usage_date: 1.days.ago)
Usage.create(lens: Lens.find(1), usage_hours: 12, usage_date: 2.days.ago)
Usage.create(lens: Lens.find(1), usage_hours: 24, usage_date: 3.days.ago)
Usage.create(lens: Lens.find(1), usage_hours: 24, usage_date: 5.days.ago)
Usage.create(lens: Lens.find(3), usage_hours: 24, usage_date: 1.days.ago)
Usage.create(lens: Lens.find(3), usage_hours: 12, usage_date: 4.days.ago)
Usage.create(lens: Lens.find(3), usage_hours: 24, usage_date: 8.days.ago)
Usage.create(lens: Lens.find(3), usage_hours: 12, usage_date: 16.days.ago)
Usage.create(lens: Lens.find(3), usage_hours: 12, usage_date: 32.days.ago)


puts 'Создали записи об использовании'
