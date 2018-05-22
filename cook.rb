require './worker.rb'
class Cook

  @salary = 20
  #Overlapping
  def initialize(worker, email)
    if(!@worker.nil?)
      @worker.deleteMaid
    end
    @worker = worker
    @email = email
  end

  def self.createCook(worker, email)
    if worker.nil?
      throw "Worker can't be nil"
    end
    cook = Cook.new(worker, email)
    worker.addCook(cook)
    cook
  end
  #Overlapping
  def deleteWorker
    @worker = nil
  end

  def getSalary
    @salary
  end

  def getEmail
    @email
  end

  def getName
    @worker.getName
  end

  def getSurname
    @worker.getSurname
  end
end