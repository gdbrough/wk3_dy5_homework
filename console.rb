require_relative("models/customer.rb")
require_relative("models/ticket.rb")
require_relative("models/screening.rb")
require_relative("models/film.rb")

require( 'pry-byebug' )

Film.delete_all()
Customer.delete_all()
Ticket.delete_all()
Screening.delete_all()

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

screening1 = Screening.new({"film_id" => film1.id, "start_time" => "10:00", "tickets_available" => 50})
screening1.save()
screening2 = Screening.new({"film_id" => film1.id, "start_time" => "17:30", "tickets_available" => 50})
screening2.save()
screening3 = Screening.new({"film_id" => film1.id, "start_time" => "20:00", "tickets_available" => 50})
screening3.save()
screening4 = Screening.new({"film_id" => film1.id, "start_time" => "23:30", "tickets_available" => 50})
screening4.save()
screening5 = Screening.new({"film_id" => film1.id, "start_time" => "22:30", "tickets_available" => 50})
screening5.save()
screening6 = Screening.new({"film_id" => film2.id, "start_time" => "14:00", "tickets_available" => 50})
screening6.save()
screening7 = Screening.new({"film_id" => film2.id, "start_time" => "16:30", "tickets_available" => 50})
screening7.save()
screening8 = Screening.new({"film_id" => film2.id, "start_time" => "19:00", "tickets_available" => 50})
screening8.save()
screening9 = Screening.new({"film_id" => film2.id, "start_time" => "21:30", "tickets_available" => 50})
screening9.save()
screening10 = Screening.new({"film_id" => film3.id, "start_time" => "16:00", "tickets_available" => 50})
screening10.save()
screening11 = Screening.new({"film_id" => film3.id, "start_time" => "18:30", "tickets_available" => 50})
screening11.save()
screening12 = Screening.new({"film_id" => film3.id, "start_time" => "21:00", "tickets_available" => 50})
screening12.save()
screening13 = Screening.new({"film_id" => film4.id, "start_time" => "19:30", "tickets_available" => 50})
screening13.save()

ticket1 = Ticket.new({"customer_id" => customer1.id, "screening_id" => screening1.id})
ticket1.save()
ticket2 = Ticket.new({"customer_id" => customer2.id, "screening_id" => screening2.id})
ticket2.save()
ticket3 = Ticket.new({"customer_id" => customer1.id, "screening_id" => screening1.id})
ticket3.save()
ticket4 = Ticket.new({"customer_id" => customer4.id, "screening_id" => screening5.id})
ticket4.save()
ticket5 = Ticket.new({"customer_id" => customer5.id, "screening_id" => screening8.id})
ticket5.save()

film4.title = "Jaws"
film4.update()

film5.delete()

customer1.name = "Shane Byrne"
customer1.update()

customer5.delete()

ticket1.customer_id = customer3.id
ticket1.update()

# ticket7.delete()

screening1.start_time = "15:00"
screening1.update()

screening4.delete()

Film.all()
Customer.all()
Ticket.all()
Screening.all()

film1.customers()
customer3.films()
screening1.customers()
#
customer1.remove_price_from_funds()
# p customer1.how_many_tickets()
# p film2.how_many_customers()
screening1.deduct_from_available_tickets()


binding.pry
nil
