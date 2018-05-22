require './worker.rb'

class Maid
  @salary = 30
  #Overlapping
  def initialize(worker, tel)
    if(!@worker.nil?)
      @worker.deleteMaid
    end
    @worker = worker
    @tel = tel
  end

  def self.createMaid(worker, email)
    if worker.nil?
      throw "Worker can't be nil"
    end
    cook = Maid.new(worker, email)
    worker.addMaid(cook)
    cook
  end
  #Overlapping
  def deleteWorker
    @worker = nil
  end

  def getSalary
    @salary
  end

  def getTel
    @tel
  end

  def getName
    @worker.getName
  end

  def getSurname
    @worker.getSurname
  end
end