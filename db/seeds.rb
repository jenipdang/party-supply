mike = User.create(name: "Mike", email: "mike", password_digest: "123456")

ellie10 = Party.create(user: mike, name: "Ellie's 10th Birthday", datetime: "Thu, 25 Mar 2022", guest_list: "family, friends, coworkers", location: "Casa Bonita Restaurant")
ls90anniversary = Party.create(user: mike, name: "Laura & Scott's 90th Anniversay", datetime: "Mon, 25 Apr 2022", guest_list: "family, friends, coworkers", location: "Villa Del Sol")
nybabyshower = Party.create(user: mike, name: "Ny's Baby Shower", datetime: "Wed, 25 May 2022", guest_list: "family, friends", location: "Casa Bonita Restaurant")

Invitation.create(user: mike, party: ellie10)

balloon = Supply.create(name: "Balloon", price: 0.10, in_stock: true)
bouncer = Supply.create(name: "Boncer House", price: 100.50, in_stock: true)
tent = Supply.create(name: "Tent", price: 40.00, in_stock: true)
chair = Supply.create(name: "Chair", price: 5.00, in_stock: true)
giftbag = Supply.create(name: "Gift Bag", price: 2.10, in_stock: true)

Expense.create(party: ellie10, supply: balloon, quantity: 100)
Expense.create(party: ellie10, supply: bouncer, quantity: 1)
Expense.create(party: ellie10, supply: tent, quantity: 10)
Expense.create(party: ellie10, supply: giftbag, quantity: 200)
Expense.create(party: ls90anniversary, supply: chair, quantity: 50)
Expense.create(party: ls90anniversary, supply: giftbag, quantity: 55)
Expense.create(party: ls90anniversary, supply: balloon, quantity: 200)
Expense.create(party: nybabyshower, supply: giftbag, quantity: 100)
Expense.create(party: nybabyshower, supply: bouncer, quantity: 2)
Expense.create(party: nybabyshower, supply: balloon, quantity: 200)


