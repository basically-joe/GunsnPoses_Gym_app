require_relative( '../db/sql_runner' )

class Event

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options ['title']
    @time_slot = ['time_slot']
    @type = ['type']
  end

end
