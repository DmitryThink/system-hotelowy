require './Osoba.rb'
class Klient < Osoba
  def initialize(name, surname, phone, address = nil, email = nil)
    super(name, surname, phone, address)
    @email = email
    @numberOfReservation = 0
  end
end

SystemHotelowy\Klient.rb