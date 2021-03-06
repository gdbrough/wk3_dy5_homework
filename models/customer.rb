require_relative("../db/sql_runner.rb")

class Customer

  attr_reader :id, :name, :funds
  attr_writer :name, :funds

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @funds = options["funds"]
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run( sql, values ).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET name = $1, funds = $2 WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN screenings ON films.id = screenings.film_id
    INNER JOIN tickets ON screenings.id = tickets.screening_id
    WHERE tickets.customer_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map { |film| Film.new(film) }
  end

  def remove_price_from_funds()
    ticket_prices = films().map {|film| film.price.to_i}
    total_price = ticket_prices.sum
    @funds -= total_price
    update()
  end

  def how_many_tickets()
    ticket_count = films().count
    return ticket_count
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map { |customer| Customer.new(customer) }
  end

end
