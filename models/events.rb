require_relative( '../db/sql_runner' )

class Event

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options ['title']
    @time_slot = ['time_slot']
    @type = ['type']
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
