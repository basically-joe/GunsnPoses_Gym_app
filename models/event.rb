require_relative( '../db/sql_runner' )

class Event

  attr_reader :id
  attr_accessor :title, :time_slot, :type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @time_slot = options['time_slot']
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO events
    (
      title,
      time_slot,
      type
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@title, @time_slot, @type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM events"
    results = SqlRunner.run( sql )
    return results.map { |hash| Event.new( hash ) }
  end

  def self.find(id) # e.g Event.find(36)
    sql = "SELECT * FROM events WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Event.new(results.first)
  end

  def update
      sql = "UPDATE events
      SET
      (
        title,
        time_slot,
        type
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@title, @time_slot, @type, @id]
      SqlRunner.run(sql, values)
  end

  def clients() # eg event1.clients
    sql = "SELECT clients.*
    FROM clients
    INNER JOIN bookings
    ON bookings.client_id = clients.id
    WHERE bookings.event_id = $1"
    values = [@id]
    client_data = SqlRunner.run(sql, values)
    return client_data.map{ |client| Client.new(client) }
  end

  def delete() # e.g. event1.delete
    sql = "DELETE FROM events
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM events"
    SqlRunner.run(sql)
  end

end
