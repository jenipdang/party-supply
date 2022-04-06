# README
Party and Supply have a many-to-many relationship through Expense.
Build the following models and tables:

Party (name, datetime, guest_list (string), location)
Supply (name, price(decimals should be acounted for), in_stock(bool))
Expense (party_id, supply_id, quantity(integer))

Build the following custom methods:
	Party: 
		#total_cost (calculates the party final cost based on the supplies purchased)
		#most_expensive_supply (find and return the most expensive supply associated with a party)
		.next_party_lined_up (find the next party based on its datetime and the current date)
		.most_supplies (find the party with the most supplies associated)
	Supply: 
		.most_expensive (find the most expensive supply)
		.reorder_supplies (find a list of all the supplies that are out of stock)
		.most_purchased (find the supply that is associated with the most parties)

Add validations for anything that you deem appropriate to validate: presence, uniqueness, dates in the future, prices greater than 0, etc.

Create the following routes and controller actions:
    /parties (GET) x
	/parties (POST) ? datetime validation not working 
	/parties/:id (GET) x
	/parties/:id (PATCH) x
	/parties/:id (DELETE) x
	/parties/:party_id/supplies (GET) x
	/parties/:party_id/supplies (POST)	??
	/supplies (GET) ??
	/supplies (POST) x
	/supplies/:id (GET) x
	/supplies/:id (PATCH) x
	/supplies/:id (DELETE) x

Make sure you take into consideration the fact that we're building nested routes, and the route parameter will be fundamental for you to structure the controller's action logic.

Test the routes and controllers with Postman 🙌🏻
