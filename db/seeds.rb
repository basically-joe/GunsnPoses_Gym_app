require_relative("../models/event.rb")
require("pry")

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

binding.pry
nil
