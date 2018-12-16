require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/client' )
also_reload( '../models/*' )

get "/clients" do
  @clients = Client.all()
  erb ( :"clients/index")
end

get '/clients/new' do
  @clients = Client.all()
  erb ( :"clients/new")
end

post '/clients' do
  Client.new(params).save
  redirect to '/clients'
end

get "/clients/:id" do
  @clients = Client.find(params['id'].to_i)
  erb ( :"clients/show")
end
