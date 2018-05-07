class Reservation
  @@maxNumberOfReservations = 15
  @@extension = []

  def initialize(dateFrom, dateTo, priceOfRoom, status, klient, priceOfService = nil)
    if(@@maxNumberOfReservations == @@extension)
      throw "Can't be more than " + @@maxNumberOfReservations + " reservations!"
    end
    if(dateFrom.nil? || dateTo.nil? || priceOfRoom.nil? || status.nil? || klient.nil?)
      throw "Can't be nil!"
    end
    @dateFrom = dateFrom
    @dateTo = dateTo
    @priceOfRoom = priceOfRoom
    @priceOfService = priceOfService
    @status = status
    @klient = klient
    @visitors = Hash.new
    @reservation_rooms = []
    @orders = []
    Reservation.add(self)
  end

  #Kompozycja############
  def addOrder(order)
    if order.nil?
      throw "Order can't be nil!"
    end
    unless @orders.include? order
      @orders << order
    end
  end

  def removeOrder(order)
    if order.nil?
      throw "Order can't be nil!"
    end
    unless @orders.include? order
      @orders.remove(order)
    end
  end

  #Z atrybut#############
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
      @reservation_rooms.remove(reservation_room)
      reservation_room.removeReservation(reservation_room)
    end
  end

  #Kwalifikowana###############
  def addVisitor(visitor)
    if visitor.nil?
      throw "Visitor can't be nil!"
    end
    unless @visitors.include?(visitor.getPhone)
      @visitors[visitor.getPhone] = visitor
      visitor.addReservation(self)
    end
  end

  def removeVisitor(visitor)
    if visitor.nil?
      throw "Visitor can't be nil!"
    end
    unless @visitors.include?(visitor.getPhone)
      @visitors.delete(visitor)
      visitor.removeReservation(self)
    end
  end

  def getVisitors
    @visitors
  end


  #Binarna##############
  def setKlient(klient)
    if klient.nil?
      throw 'Klient can\'t be nil!'
    end
    @klient = klient
    klient.removeReservation(self)
    klient.addReservation(self)
  end

  def removeKlient
    klient.removeReservation(self)
  end

  def getKlient
    @klient
  end

  #Przesłanianie metod
  ###############################################################################################################################################
  def to_s
    puts 'Rezerwacja:''  z daty - ' + @dateFrom.to_s[0..9] + '  do daty - ' + @dateTo.to_s[0..9] + '  cena rezerwacji '
    puts '  List of orders:'
    @orders.each do |order|
      puts '    ' + order.to_s
    end
    puts '  List of visitors:'
    @visitors.each do |visitor, v|
      puts '    ' + v.to_s
    end
    puts '  ' + @klient.to_s
    ' '
  end
  ###############################################################################################################################################

  #Ekst. - trwałość
  ###############################################################################################################################################
  def self.write(filename)
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

  def self.read(filename)
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

  def self.add(reservation)
    @@extension << reservation
  end

  def self.remove(reservation)
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
    if(@priceOfService.nil?)
      @totalprice = @priceOfRoom
    else
      @totalprice = @priceOfRoom + @priceOfService
    end
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

