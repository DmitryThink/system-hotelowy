require './osoba.rb'

class Klient < Osoba
  @@extension = []

  def initialize(name, surname, phone, address = nil, email = nil)
    @name = name
    @surname = name
    @phone = phone
    @address = address
    @email = email
    @reservations = []
    Klient.add(self)
  end

  def getInfo
    @name + ' ' + @surname + ' ' + @phone
  end

  def to_s
    'Klient: name = ' + @name + ' surname = ' + @surname
  end

  #Binarna##############
  def addReservation(reservation)
    if reservation.nil?
      throw 'Reservation can\'t be nil!'
    end
    unless @reservations.include? reservation
      @reservations << reservation
    end
  end

  def removeReservation(reservation)
    unless @reservations.include? reservation
      @reservations.delete(reservation)
      reservation.removeKlient
    end
  end

  def self.getExtention
    @@extension
  end

  def self.add(klient)
    @@extension << klient
  end

  def self.remove(klient)
    @@extension.delete(klient)
  end

  def self.showExtention
    puts 'Lista klientów: '
    @@extension.each do |klient|
      puts klient.to_s + ' '
    end
    puts
  end
end
