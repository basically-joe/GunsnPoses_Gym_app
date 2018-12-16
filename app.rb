require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/events_controller')
require_relative('controllers/clients_controller')
require_relative('controllers/bookings_controller')

get '/' do
  erb( :index )
end
