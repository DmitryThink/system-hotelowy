class Osoba
  #Klasa abstrakcyjna
  @name
  @surname
  @phone
  @address

  def initialize
    throw "Osoba is abstract!"
  end

  def getInfo
    throw "getFullName is abstract!"
  end
end