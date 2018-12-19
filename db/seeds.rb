require_relative("../models/event")
require_relative("../models/client")
require_relative("../models/booking")
require("pry")

Booking.delete_all()
Event.delete_all()
Client.delete_all()

event1 = Event.new({
  "title" => "Zoomba",
  "time_slot" => "09:00",
  "event_date" => "07/01/2019",
  "type" => "Aerobic",
  "capacity" => "3"
  })

event1.save()

event2 = Event.new({
  "title" => "Spin Mania",
  "time_slot" => "18:00",
  "event_date" => "08/01/2019",
  "type" => "Aerobic",
  "capacity" => "10"
  })

event2.save()

event3 = Event.new({
  "title" => "Body Pump",
  "time_slot" => "17:30",
  "event_date" => "09/01/2019",
  "type" => "Strength",
  "capacity" => "10"
  })

event3.save()

event4 = Event.new({
  "title" => "Yoga: Beginners",
  "time_slot" => "19:00",
  "event_date" => "09/01/2019",
  "type" => "Flexibility",
  "capacity" => "10"
  })

event4.save()

event5 = Event.new({
  "title" => "Yoga: Pro",
  "time_slot" => "18:00",
  "event_date" => "10/01/2019",
  "type" => "Flexibility",
  "capacity" => "10"
  })

event5.save()

# event1.title = "Boxercise"
# event1.update

client1 = Client.new({
  "first_name" => "Joe",
  "last_name" => "McColl",
  "age" => 32
  })

client1.save()

client2 = Client.new({
  "first_name" => "Jodie",
  "last_name" => "Tennant",
  "age" => 32
  })

client2.save()

client3 = Client.new({
  "first_name" => "Kimberly",
  "last_name" => "Tennant",
  "age" => 32
  })

client3.save()

client4 = Client.new({
  "first_name" => "Jock",
  "last_name" => "McKay",
  "age" => 62
  })

client4.save()

client5 = Client.new({
  "first_name" => "Sheena",
  "last_name" => "McKay",
  "age" => 59
  })

client5.save()

client6 = Client.new({
  "first_name" => "Cheryl",
  "last_name" => "Keenan",
  "age" => 18
  })

client6.save()

# client6.first_name = "JimmityJim"
# client6.update

booking1 = Booking.new({
  "event_id" => event1.id,
  "client_id" => client1.id
   })

booking1.save()

booking2 = Booking.new({
  "event_id" => event2.id,
  "client_id" => client2.id
   })

booking2.save()

booking3 = Booking.new({
  "event_id" => event3.id,
  "client_id" => client3.id
   })

booking3.save()

booking4 = Booking.new({
  "event_id" => event4.id,
  "client_id" => client4.id
   })

booking4.save()

booking5 = Booking.new({
  "event_id" => event5.id,
  "client_id" => client4.id
   })

booking5.save()

booking6 = Booking.new({
  "event_id" => event5.id,
  "client_id" => client5.id
   })

booking6.save()

booking7 = Booking.new({
  "event_id" => event5.id,
  "client_id" => client6.id
   })

booking7.save()

# booking6.event_id = event1.id
# booking6.update

binding.pry
nil
