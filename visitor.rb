require './osoba.rb'
class Visitor < Osoba
  @@extension = []

  def initialize(name, surname, phone, address = nil)
    @name = name
    @surname = name
    @phone = phone
    @address = address
    @reservations = []
    Klient.add(self)
  end

  #Klasa abstrakcyjna
  def getInfo
    @name + ' ' + @surname
  end

  #Kwalifikowana###############
  def addReservation(reservation)
    if reservation.nil?
      throw "Reservation can't be nil!"
    end
    unless @reservations.include? reservation
      @reservations << reservation
      reservation.addVisitor(self)
    end
  end

  def removeReservation(reservation)
    if reservation.nil?
      throw "Reservation can't be nil!"
    end
    unless reservations.include? reservation
      reservation.removeVisitor
      @reservations.delete(reservation)
    end
  end

  def to_s
    'Visitor: name = ' + @name + ' surname  = ' + @surname + ' phone = ' + @phone.to_s
  end

  def getPhone
    @phone
  end

  def self.getExtention
    @@extension
  end

  def self.add(visitor)
    @@extension << visitor
  end

  def self.remove(visitor)
    @@extension.delete(visitor)
  end

  def self.showExtention
    puts 'Lista klientów: '
    @@extension.each do |visitor|
      puts visitor.to_s + ' '
    end
    puts
  end
end