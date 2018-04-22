require './Reservation.rb'

dateFrom = Time.new
dateTo = Time.new(2019, 11, 1)
reservation1 = Reservation.new(dateFrom, dateTo,  120, ['wolny', 'spatany'])
reservation2 = Reservation.new(dateFrom, dateTo,  120, ['zajenty'], 3)
Reservation.writeReservations('what.bin')
Reservation.showExtention
Reservation.removeReservation(reservation1)
Reservation.removeReservation(reservation2)
Reservation.showExtention
Reservation.readReservations('what.bin')
Reservation.showExtention

puts Reservation.priceOfAllRevervations
res = Reservation.getExtention[0]
puts res.getStatus