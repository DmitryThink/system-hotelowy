require './reservation.rb'
require './visitor.rb'
require './klient.rb'
reservation1 = Reservation.new(Time.now, Time.now, 1, [], 1)
reservation2 = Reservation.new(Time.now, Time.now, 1, [], 1)

visitor1 = Visitor.new('n', 's', 1)
visitor1 = Visitor.new('n', 's', 2)

klient1 = Klient.new('n', 's', 4)
klient2 = Klient.new('n', 's', 3)

reservation1.setKlient(klient1)
reservation2.setKlient(klient2)

reservation1.addVisitor(visitor1)
reservation1.addVisitor(visitor1)

puts reservation1.getVisitors