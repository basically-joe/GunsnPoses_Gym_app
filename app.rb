require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/events_controller')

get '/' do
  erb( :index )
end
