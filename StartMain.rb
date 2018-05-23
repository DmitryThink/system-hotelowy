require './reservation.rb'
require './visitor.rb'
require './klient.rb'
require './reservation_room.rb'
require './room.rb'
require './Order.rb'
require './osoba.rb'
require './worker.rb'
require './female.rb'
require './male.rb'
require './maid.rb'

#Ograniczenie atrybutu
klient = Klient.new("name", "surname", "phone")
reservation = Reservation.new(Time.new, Time.new, 9000, ['wolne'], 4500)
reservation.setKlient(klient)
#reservation.setPriceOfRoom(10000) ##exception > 9999
#reservation.setPriceOfService(5000)

#Unique
bill = Klient.new("Bill", "Clinton", "1234")
anna = Klient.new("Anna", "Partinson", "1235")
#anna = Klient.new("Anna", "Partinson", "1234")

#Subset
# Klient -> make -> reservation
# Klient -> beVip -> reservation ^subset
bill = Klient.new("Bill", "Clinton", "124")
reservation = Reservation.new(Time.new, Time.new, 123, ['wolne'])
reservation.setKlient(bill)
bill.beVip(reservation)
#reservation.setVip(klient)
#klient.beVip(reservation) #can't be
puts reservation.getListOfAdditionalServices.to_s

#Ordered
reservation = Reservation.new(Time.new, Time.new(2017,2,2), 123, ['wolne'])
reservation.setKlient(klient)
puts Reservation.getExtention

#Bag
# ROOM (1) <-> (*) RESERVATION_ROOM (*) <-> (1) RESERVATION
reservation = Reservation.new(Time.new, Time.new(2017,2,2), 123, ['wolne'])
room = Room.new(1,2,123,'wolne')
reservation_room = ReservationRoom.new(123, room, reservation)

#XOR
klient = Klient.new("name", "surname", "phone1")
visitor = Visitor.new("name", "survisit", "123")
reservation = Reservation.new(Time.new, Time.new(2017,2,2), 123, ['wolne'])
reservation.setKlient(klient)
#reservation.addVisitor(visitor)

#Ograniczenie Własne (Orders can't be more than 2x od amount of Visitors) #dynam
reservation = Reservation.new(Time.new, Time.new(2017,2,2), 123, ['wolne'])
visitor = Visitor.new("name", "survisit", "123")
reservation.addVisitor(visitor)
reservation.addVisitor(Visitor.new("name", "survisit", "124"))
Order.createOrder(reservation,123)
Order.createOrder(reservation,123)
#Order.createOrder(reservation,123) #more than 2x Visitors

#stat
#Reservation.new(Time.new, Time.new(2017,2,2), 123, ['wolne'])

puts
puts
puts

puts "#Klasa abstrakcyjna i polimorficzne wołanie metod"
klient = Klient.new("Will", "Name", "3000")
visitor = Visitor.new("Bird", "What", "34")
puts klient.getInfo
puts visitor.getInfo

puts
puts "#Overlapping"
male = Male.new(true)
female = Female.new('Karol')
worker = Worker.new("name", "surname", male)
puts worker.whoIAm
worker.addCook("email.com")
puts worker.whoIAm
puts "#Wielodziedziczenie"
worker.addMaid("324")
puts worker.whoIAm
maidCookier = Worker.new('Anna', 'Fox', female, '390202022', 'Anna.Lil@gmail.com')
puts maidCookier.getMiadCookier.getEmailAndTel

puts
puts "#Wieloaspektowe"
workerMale = Worker.new("name", "surname", male)
workerFemale = Worker.new("Anna", "Kein", female)

#dinamic
worker = Worker.new('Bill', 'Clinton', male)
puts  'Worker: ' + worker.getName + ' ' + worker.getSurname
maid = Maid.new(worker, '123123213')
puts  'Maid: ' + maid.getName + ' ' + maid.getSurname
cook = Cook.new(worker, 'email@email.com')
puts 'Cook: ' + cook.getName + ' ' + cook.getSurname






