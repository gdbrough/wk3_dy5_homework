require_relative("../db/sql_runner.rb")

class Ticket

  attr_reader :id, :film_id, :customer_id
  attr_writer :film_id, :customer_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @film_id = options["film_id"]
    @customer_id = options["customer_id"]
  end

  def save()
    sql = "INSERT INTO tickets (film_id, customer_id)
    VALUES ($1, $2)
    RETURNING id"
    values = [@film_id, @customer_id]
    ticket = SqlRunner.run( sql, values ).first
    @id = ticket['id'].to_i
  end

end