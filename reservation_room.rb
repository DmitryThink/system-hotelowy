class ReservationRoom
  def initialize(price, room, reservation)
    if price.nil? || room.nil? || reservation.nil?
      throw "Can't be nil!"
    end
    @price
    @room
    setReservation(reservation)
    setRoom(room)
  end

  def getRoom
    @room
  end

  def getReservation
    @reservation
  end

  private
  #Z atrybut#############
  def setReservation(reservation)
    if reservation.nil?
      throw "Reservation can't be nil!"
    end
    unless @reservation.equal? reservation
      @reservation = reservation
      reservation.addReservationRoom(self)
    end
  end

  def removeReservation(reservation)
    if reservation.nil?
      throw "Reservation can't be nil!"
    end
    @reservation = nil
    reservation.removeReservationRoom(reservation)
  end

  def setRoom(room)
    if room.nil?
      throw "Reservation can't be nil!"
    end
    unless @room.equal? room
      @room = room
      room.addReservationRoom(self)
    end
  end

  def removeRoom(room)
    if room.nil?
      throw "Reservation can't be nil!"
    end
    @room = nil
    room.removeReservationRoom(room)
  end
end