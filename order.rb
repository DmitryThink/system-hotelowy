class Order
  def initialize(reservation, price)
    if reservation.nil? || price.nil?
      throw "Can't be nil!"
    end
    @reservation = reservation
    @price = price
  end

  #Kompozycja############
  def self.createOrder(reservation, price)
    if reservation.nil?
      throw "Reservation can't be nil"
    end
    order = Order.new(reservation, price)
    reservation.addOrder(order)
    order
  end

  def to_s
    'Order: price = ' + @price.to_s
  end
end