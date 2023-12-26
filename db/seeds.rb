# db/seeds.rb

# Создаем пять типов линз
LensType.create(manufacturer: 'Acuvue Oasis', prescription: '-1.75', wearing_period: 14)
LensType.create(manufacturer: 'Acuvue Oasis', prescription: '-2.0', wearing_period: 14)
LensType.create(manufacturer: 'Acuvue Oasis', prescription: '-2.5', wearing_period: 14)
LensType.create(manufacturer: 'B&L', prescription: '-1.75', wearing_period: 1)
LensType.create(manufacturer: 'B&L', prescription: '-2.0', wearing_period: 1)

puts 'Five LensTypes created successfully.'

# Создаем четыре линзы
Lens.create(status: 'Active', usage_days: 10, lens_type: LensType.find(1))
Lens.create(status: 'Active', usage_days: 10, lens_type: LensType.find(1))
Lens.create(status: 'Active', usage_days: 1, lens_type: LensType.find(4))
Lens.create(status: 'Active', usage_days: 1, lens_type: LensType.find(4))



puts 'Four Lenses created successfully.'
