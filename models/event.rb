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

  def self.find(id)
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

  def delete()
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
