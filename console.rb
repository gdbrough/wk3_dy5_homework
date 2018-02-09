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
film4 = Film.new({"title" => "Jaws", "price" => 5})
film4.save()
film5 = Film.new({"title" => "Day After Tomorrow", "price" => 7})
film5.save

customer1 = Customer.new({"name" => "Bob McClumfer", "funds" => 20})
customer1.save()

ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film4.id})
ticket1.save()



binding.pry
nil
