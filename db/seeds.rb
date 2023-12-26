# db/seeds.rb

User.create(name: 'Иван Иванов', email: 'ivanov@example.com', password: '12345678')
User.create(name: 'Петр Петров', email: 'petrov@example.com', password: '12345678')

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
