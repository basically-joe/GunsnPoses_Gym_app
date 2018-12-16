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

get '/clients/:id/edit' do
  @clients = Client.find(params['id'].to_i)
  erb ( :"clients/edit")
end

post '/clients/:id' do
  client = Client.new(params)
  client.update
  redirect to "/clients/#{params['id']}"
end
