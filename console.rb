require_relative("models/customer.rb")
require_relative("models/film.rb")
require_relative("models/ticket.rb")

require( 'pry-byebug' )

film1 = Film.new({"title" => "Star Wars", "price" => 10})
film1.save()
film2 = Film.new({"title" => "Blues Brothers", "price" => 5})
film2.save()
film3 = Film.new({"title" => "Coherence", "price" => 12})
film3.save()
film4 = Film.new({"title" => "Paws", "price" => 5})
film4.save()
film5 = Film.new({"title" => "Day After Tomorrow", "price" => 7})
film5.save

customer1 = Customer.new({"name" => "My Name", "funds" => 20})
customer1.save()
customer2 = Customer.new({"name" => "Barry Sheene", "funds" => 30})
customer2.save()
customer3 = Customer.new({"name" => "Carl Foggerty", "funds" => 40})
customer3.save()
customer4 = Customer.new({"name" => "Colin Edwards", "funds" => 50})
customer4.save()
customer5 = Customer.new({"name" => "Customer to be Deleted", "funds" => 100})
customer5.save()
customer6 = Customer.new({"name" => "Kenny Roberts", "funds" => 60})
customer6.save()

ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id})
ticket1.save()
ticket2 = Ticket.new({"customer_id" => customer1.id, "film_id" => film2.id})
ticket2.save()
ticket3 = Ticket.new({"customer_id" => customer1.id, "film_id" => film3.id})
ticket3.save()
ticket4 = Ticket.new({"customer_id" => customer1.id, "film_id" => film4.id})
ticket4.save()
ticket5 = Ticket.new({"customer_id" => customer1.id, "film_id" => film5.id})
ticket5.save()
ticket6 = Ticket.new({"customer_id" => customer5.id, "film_id" => film2.id})
ticket6.save()
ticket7 = Ticket.new({"customer_id" => customer2.id, "film_id" => film2.id})
ticket7.save()
ticket8 = Ticket.new({"customer_id" => customer3.id, "film_id" => film2.id})
ticket8.save()

film4.title = "Jaws"
film4.update()

film5.delete()

customer1.name = "Shane Byrne"
customer1.update()

customer5.delete()

ticket3.customer_id = customer3.id
ticket3.update()

ticket7.delete()

Film.all()
Customer.all()
Ticket.all()

# Film.delete_all()
# Customer.delete_all()
# Ticket.delete_all()

film2.customers()
customer1.films()

customer1.remove_price_from_funds()
p customer1.how_many_tickets()
p film2.how_many_customers()


binding.pry
nil
