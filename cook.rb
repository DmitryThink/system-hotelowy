require './worker.rb'
class Cook

  @salary = 20

  def initialize(worker, email)
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

  def deleteWorker
    @worker = nil
  end

  def getSalary
    @salary
  end

  def getEmail
    @email
  end
end