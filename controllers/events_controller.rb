require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/event' )
require_relative( '../models/client' )
also_reload( '../models/*' )

get "/events" do
  @events = Event.all()
  erb ( :"events/index")
end

get '/events/new' do
  @events = Event.all()
  erb ( :"events/new")
end

post '/events' do
  Event.new(params).save
  redirect to '/events'
end

get "/events/:id" do
  @events = Event.find(params['id'].to_i)
  erb ( :"events/show")
end

get '/events/:id/edit' do
  @events = Event.find(params['id'].to_i)
  erb ( :"events/edit")
end

post '/events/:id' do
  event = Event.new(params)
  event.update
  redirect to "/events/#{params['id']}"
end

post '/events/:id/delete' do
  event = Event.find(params['id'].to_i)
  event.delete
  redirect to '/events'
end
