require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/event' )
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
