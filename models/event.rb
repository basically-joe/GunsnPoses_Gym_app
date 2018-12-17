require_relative( '../db/sql_runner' )

class Event

  attr_reader :id
  attr_accessor :title, :time_slot, :event_date, :type, :capacity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @time_slot = options['time_slot']
    @event_date = options['event_date']
    @type = options['type']
    @capacity = options['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO events
    (
      title,
      time_slot,
      event_date,
      type,
      capacity
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@title, @time_slot, @event_date, @type, @capacity]
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
      event_date,
      type,
      capacity
      ) =
      (
        $1, $2, $3, $4, $5
      )
      WHERE id = $6"
      values = [@title, @time_slot, @event_date, @type, @capacity, @id]
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

    def event_count() # e.g. event5.event_count
      return clients.count
    end

    def event_has_capacity()
      if @capacity > event_count()
        return true
      else
        return false
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
