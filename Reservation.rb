class Reservation
  @@numberOfReservations = 0
  @@extension = []

  def initialize(dateFrom, dateTo, priceOfRoom, status, priceOfService = 0)
    @dateFrom = dateFrom
    @dateTo = dateTo
    @priceOfRoom = priceOfRoom
    @priceOfService = priceOfService
    @status = status
    Reservation.addReservation(self)
  end

  #Przesłanianie metod
  ###############################################################################################################################################
  def to_s
    'Rezerwacja:''  z daty - ' + @dateFrom.to_s[0..9] + '  do daty - ' + @dateTo.to_s[0..9] + '  cena rezerwacji ' + getTotalPrice.to_s
  end
  ###############################################################################################################################################

  #Ekst. - trwałość
  ###############################################################################################################################################
  def self.writeReservations(filename)
    File.open(filename, 'w') do |f|
      f.puts(@@extension.length)
      @@extension.each do |reservation|
        f.puts(reservation.getDateFrom)
        f.puts(reservation.getDateTo)
        f.puts(reservation.getPriceOfRoom)
        reservation.getStatus.each do |status|
          f.print(status + ' ')
        end
        f.puts
        f.puts(reservation.getPriceOfService)
      end
    end
  end

  def self.readReservations(filename)
    File.open(filename, 'r') do |f|
      countOfReservations = Integer(f.gets)
      @@extension.clear
      while countOfReservations != 0
        dateFromList = f.gets.split('-')
        dateFrom = Time.new(dateFromList[0],dateFromList[1],dateFromList[2])
        dateFromTo = f.gets.split('-')
        dateTo = Time.new(dateFromTo[0],dateFromTo[1],dateFromTo[2])
        priceOfRoom = Integer(f.gets)
        status = f.gets.split(' ')
        priceofService = Integer(f.gets)
        Reservation.new(dateFrom, dateTo, priceOfRoom, status, priceofService)
        countOfReservations = countOfReservations - 1
      end
    end
  end
  ###############################################################################################################################################

  #Ekstensja
  ###############################################################################################################################################
  def self.getExtention
    @@extension
  end

  def self.addReservation(reservation)
    @@numberOfReservations += 1
    @@extension << reservation
  end

  def self.removeReservation(reservation)
    @@numberOfReservations -= 1
    @@extension.delete(reservation)
  end

  def self.showExtention
    puts 'Lista reservacji: '
    @@extension.each do |reservation|
      puts reservation.to_s + ' '
    end
    puts
  end
  ###############################################################################################################################################

  #Atrybut pochodny
  ###############################################################################################################################################
  def getTotalPrice
    @totalprice = @priceOfRoom + @priceOfService
  end

  #Metoda klasowa
  def self.priceOfAllRevervations
    price = 0
    @@extension.each do |reservation|
      price = price + reservation.getTotalPrice
    end
    price
  end
  ###############################################################################################################################################

  # GETTERS AND SETTERS
  #############
  def getDateFrom
    @dateFrom
  end
  def serDateFrom(dateFrom)
    @dateFrom = dateFrom
  end
  ###############################################################################################################################################

  ###############################################################################################################################################
  def getDateTo
    @dateTo
  end
  def setDateTo(dateTo)
    @dateTo = dateTo
  end
  ###############################################################################################################################################

  ###############################################################################################################################################
  def getPriceOfRoom
    @priceOfRoom
  end
  def setPriceOfRoom(priceOfRoom)
    @priceOfRoom = priceOfRoom
  end
  ###############################################################################################################################################

  ###############################################################################################################################################
  def getPriceOfService
    @priceOfService
  end
  def setPriceOfService(priceOfService)
    @priceOfService = priceOfService
  end
  ###############################################################################################################################################
  def getStatus
    @status
  end
  def setStatus(status)
    @status = status
  end
  ###############################################################################################################################################

  #Przeciążanie metod
  ###############################################################################################################################################
  def setStatus(status1, status2)
    status = [status1, status2]
    @status = status
  end
  ###############################################################################################################################################
end

