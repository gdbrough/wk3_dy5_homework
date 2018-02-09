require_relative("../db/sql_runner.rb")

class Film

  attr_reader :id, :title, :price
  attr_writer :title, :price

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @price = options["price"]
  end

  def save()
    sql = "INSERT INTO films (title, price)
    VALUES ($1, $2)
    RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run( sql, values ).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET title = $1, price = $2 WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "select customers.* from customers
    inner join tickets on customers.id = tickets.customer_id
    inner join screenings on tickets.screening_id = screenings.id
    where screenings.film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map { |film| Customer.new(film) }
  end

  def how_many_customers()
    customer_count = customers().count
    return customer_count
  end

  def most_popular_time()
    sql = "select screenings.* from screenings
    where screenings.id in (
      select screenings.id from screenings where screenings.film_id = $1
    )
    and screenings.id in (
      select tickets.screening_id from tickets
      group by screening_id
      order by count(screening_id)
      desc limit 1
    )"
    values = [@id]
    most_popular_time = SqlRunner.run(sql, values)
    return most_popular_time.map { |time| time }
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return films.map { |film| Film.new(film) }
  end

end
