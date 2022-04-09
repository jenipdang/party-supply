
puts "🌱 Creating users..."
mike = User.create!(name: "Mike", email: "mike@yahoo.com", password: "mike123456")
racheal = User.create!(name: "Racheal", email: "racheal@yahoo.com", password: "racheal123456")
jeni = User.create!(name: "Jeni", email: "jeni@yahoo.com", password: "jeni123456")
matteo = User.create!(name: "Matteo", email: "matteo@yahoo.com", password: "matteo123456")

puts "🌱 Creating parties..."
ellie10 = Party.create!(user_id: 1, name: "Ellie's 10th Birthday", datetime: "Mon, 25 APR 2022", guest_list: "family, friends, coworkers", location: "Casa Bonita Restaurant")
ls90anniversary = Party.create(user_id: 2, name: "Laura & Scott's 90th Anniversay", datetime: "Mon, 25 Apr 2022", guest_list: "family, friends, coworkers", location: "Villa Del Sol")
nybabyshower = Party.create(user_id: 3, name: "Ny's Baby Shower", datetime: "Wed, 25 May 2022", guest_list: "family, friends", location: "Casa Bonita Restaurant")
christybabyshower = Party.create(user_id: 4, name: "Christy Baby Shower", datetime: "Thu, 26 May 2022", guest_list: "family, friends", location: "Casa Bonita Restaurant")

puts "🌱 Creating invitations..."
Invitation.create(user_id: 1, party_id: 1)
Invitation.create(user_id: 2, party_id: 2)
Invitation.create(user_id: 3, party_id: 3)
Invitation.create(user_id: 4, party_id: 4)

puts "🌱 Creating supplies..."
balloon = Supply.create(name: "Balloon", price: 0.10, in_stock: true)
bouncer = Supply.create(name: "Boncer House", price: 100.50, in_stock: true)
tent = Supply.create(name: "Tent", price: 40.00, in_stock: true)
chair = Supply.create(name: "Chair", price: 5.00, in_stock: true)
giftbag = Supply.create(name: "Gift Bag", price: 2.10, in_stock: true)

puts "🌱 Creating expenses..."
Expense.create(party_id: 1, supply_id: 1, quantity: 100)
Expense.create(party_id: 1, supply_id: 2, quantity: 1)
Expense.create(party_id: 1, supply_id: 3, quantity: 10)
Expense.create(party_id: 1, supply_id: 5, quantity: 200)
Expense.create(party_id: 2, supply_id: 4, quantity: 50)
Expense.create(party_id: 2, supply_id: 5, quantity: 55)
Expense.create(party_id: 2, supply_id: 1, quantity: 200)
Expense.create(party_id: 3, supply_id: 5, quantity: 100)
Expense.create(party_id: 3, supply_id: 2, quantity: 2)
Expense.create(party_id: 3, supply_id: 1, quantity: 200)
Expense.create(party_id: 4, supply_id: 1, quantity: 200)
Expense.create(party_id: 34, supply_id: 1, quantity: 50)

puts "🌱 Seeding done!"
