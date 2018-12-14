require_relative( '../db/sql_runner' )

class Event

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

end
