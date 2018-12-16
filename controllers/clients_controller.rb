require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/client' )
also_reload( '../models/*' )

get "/clients" do
  @clients = Client.all()
  erb ( :"clients/index")
end
