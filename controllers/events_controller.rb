require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/event' )
also_reload( '../models/*' )

get "/events" do
  @events = Event.all()
  erb ( :"events/index")
end
