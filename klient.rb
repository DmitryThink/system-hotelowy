require './osoba.rb'
require 'set.rb'

class Klient < Osoba
  @@extension = []
  @@phones = Set.new
  @@connections = ['make', 'has']

  def initialize(name, surname, phone, address = nil, email = nil)
    @name = name
    @surname = name
    setPhone(phone)
    @address = address
    @email = email
    @reservations = []
    @reserv_reservations
    Klient.add(self)
  end

  #Klasa abstrakcyjna
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

  def beVip(reservation)
    if reservation.nil?
      throw 'Reservation can\'t be nil!'
    end
    if @reservations.include? reservation
      reservation.setVip
    else
      throw "For being Vip you need to have connetion with this reservation!"
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

  def setPhone(phone)
    if !@@phones.include?(phone)
      @phone = phone
      @@phones.add(phone)
    else
      throw "Some client already has this phone! Try again."
    end
  end

  def hasConnections?(connection, object)
    if !@@connections.include?(connection)
      throw "Connection is not exists!"
    end
  end
end
