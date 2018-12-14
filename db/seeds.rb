require_relative("../models/event.rb")
require_relative("../models/client.rb")
require("pry")

Event.delete_all()
Client.delete_all()

event1 = Event.new({
  "title" => "Zoomba",
  "time_slot" => "09:00",
  "type" => "Aerobic"
  })

event1.save()

event2 = Event.new({
  "title" => "Spin Mania",
  "time_slot" => "18:00",
  "type" => "Aerobic"
  })

event2.save()

event3 = Event.new({
  "title" => "Body Pump",
  "time_slot" => "17:30",
  "type" => "Strength"
  })

event3.save()

event4 = Event.new({
  "title" => "Yoga: Beginners",
  "time_slot" => "19:00",
  "type" => "Flexibility"
  })

event4.save()

event5 = Event.new({
  "title" => "Yoga: Pro",
  "time_slot" => "18:00",
  "type" => "Flexibility"
  })

event5.save()

event1.title = "Boxercise"
event1.update

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

client6.first_name = "JimmityJim"
client6.update

binding.pry
nil
