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

male = Male.new(true)
female = Female.new('Karol')

worker = Worker.new('Bill', 'Clinton', male)
puts  'Worker: ' + worker.getName + ' ' + worker.getSurname
maid = Maid.new(worker, '123123213')
puts  'Maid: ' + maid.getName + ' ' + maid.getSurname
cook = Cook.new(worker, 'email@email.com')
puts 'Cook: ' + cook.getName + ' ' + cook.getSurname


maidCookier = Worker.new('Anna', 'Fox', female, '390202022', 'Anna.Lil@gmail.com')

puts maidCookier.getMiadCookier.getEmailAndTel



