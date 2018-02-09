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
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets ON customers.id = tickets.customer_id
    WHERE tickets.film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map { |film| Customer.new(film) }
  end

  def remove_price_from_funds()
    # Pull fee(s) from Moviestar
    funds = customers().map {|cust| cust.funds.to_i}
    # Calculation total fees
    # total_fees = 0
    # for fee in fees
    #   total_fees += fee
    # end
  # or
    # fees.each {| fee | total_fees += fee}
  # or
    # total_fees = fees.sum
    # Movie Budget -= Total Fees
    @budget -= total_fees

    update()
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
