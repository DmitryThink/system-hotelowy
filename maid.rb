require './worker.rb'

class Maid

  @salary = 30

  def initialize(worker, tel)
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

  def deleteWorker
    @worker = nil
  end

  def getSalary
    @salary
  end

  def getTel
    @tel
  end
end