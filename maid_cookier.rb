require './cook.rb'
require './i_maid.rb'
require './maid.rb'

class MaidCookier < Cook
  include IMaid
  #Wielodziedziczen
  @salary = 40

  def initialize(worker, tel, email)
    if(!@worker.nil?)
      @worker.deleteMaid
    end
    @worker = worker
    @email = email
    @maid = Maid.new(worker, tel)
  end

  def getSalary
    @salary
  end

  def getEmail
    @email
  end

  def getTel
    @tel
  end

  def getEmailAndTel
    @email + ' ' + @maid.getTel
  end
end