require( 'sinatra' )
require( 'pry' )
require( 'sinatra/contrib/all' )
require_relative( '../models/booking' )
require_relative( '../models/client' )
require_relative( '../models/event' )
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all
  erb ( :"bookings/index" )
end

get '/bookings/new' do
  @events = Event.all
  @clients = Client.all
  erb(:"bookings/new")
end

post '/bookings' do
  event = Event.find(params['event_id'])
  client = Client.find(params['client_id'])
  if !event.is_full?()
    event.update_class_capacity()
    booking = Booking.new(params)
    booking.save
    redirect to("/")
    binding.pry
  else
    redirect to("/bookings/error")
  end
end

get '/bookings/error' do
  @bookings = Booking.all
  erb(:"bookings/error")
end

post '/bookings/:id/delete' do
  booking = Booking.find(params['id'].to_i)
  booking.delete
  redirect back
end
