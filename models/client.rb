require_relative( '../db/sql_runner' )

class Client

  attr_accessor :first_name, :last_name, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO clients
    (
      first_name,
      last_name,
      age
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

#   def self.all()
#     sql = "SELECT * FROM events"
#     results = SqlRunner.run( sql )
#     return results.map { |hash| Event.new( hash ) }
#   end
#
#   def self.find(id)
#     sql = "SELECT * FROM events WHERE id = $1"
#     values = [id]
#     results = SqlRunner.run(sql, values)
#     return Event.new(results.first)
#   end
#
#   def delete()
#     sql = "DELETE FROM events
#     WHERE id = $1"
#     values = [@id]
#     SqlRunner.run(sql, values)
#   end
#
#   def self.delete_all
#     sql = "DELETE FROM events"
#     SqlRunner.run(sql)
#   end
#
# end
