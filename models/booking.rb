require_relative( '../db/sql_runner' )

class Booking

  attr_reader :id
  attr_accessor :event_id, :client_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @event_id = options['event_id'].to_i
    @client_id = options['client_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
    (
      event_id,
      client_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@event_id, @client_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run( sql )
    return results.map { |hash| Booking.new( hash ) }
  end

  def self.find(id)
    sql = "SELECT * FROM bookings WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Booking.new(results.first)
  end

  def update()
    sql = "UPDATE bookings
    SET
    (
      event_id,
      client_id
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@event_id, @client_id, @id]
      SqlRunner.run(sql, values)
    end

    # def delete()
    #   sql = "DELETE FROM events
    #   WHERE id = $1"
    #   values = [@id]
    #   SqlRunner.run(sql, values)
    # end
    #
    # def self.delete_all
    #   sql = "DELETE FROM events"
    #   SqlRunner.run(sql)
    # end
    #
  end
