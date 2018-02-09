require_relative("../db/sql_runner.rb")

class Screening

  attr_reader :id, :film_id, :start_time, :tickets_available
  attr_writer :film_id, :start_time, :tickets_available

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @film_id = options["film_id"]
    @start_time = options["start_time"]
    @tickets_available = options["tickets_available"]
  end

  def save()
    sql = "INSERT INTO screenings (film_id, start_time, tickets_available)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@film_id, @start_time, @tickets_available]
    screening = SqlRunner.run( sql, values ).first
    @id = screening['id'].to_i
  end

  def update()
    sql = "UPDATE screenings SET film_id = $1, start_time = $2, tickets_available = $3 WHERE id = $4"
    values = [@film_id, @start_time, @tickets_available, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql, values)
  end

end
