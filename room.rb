class Room
  def initialize(number, numberOfPeople, price, type)
    @number = number
    @numberOfPeople = numberOfPeople
    @price = price
    @type = type
    @reservation_rooms = []
  end

  def addReservationRoom(reservation_room)
    if reservation_room.nil?
      throw "ReservationRoom can't be nil!"
    end
    unless @reservation_rooms.include?(reservation_room)
      @reservation_rooms << reservation_room
      reservation_room.setReservation(self)
    end
  end

  def removeReservationRoom(reservation_room)
    if reservation_room.nil?
      throw "ReservationRoom can't be nil!"
    end
    unless @reservation_rooms.include?(reservation_room)
      @reservation_rooms.remove.reservation_room
      reservation_room.removeReservation(reservation_room)
    end
  end

end