require './gender.rb'
class Gender
  #Wieloaspektowe
  def initialize(worker)
    @worker = worker
  end

  def createGender(worker)
    if worker.nil?
      throw "Worker can't be nil"
    end
    gender = Gender.new(worker)
    worker.addGender(gender)
    gender
  end

  def setWorker(worker)
    if(worker.nil?)
      throw "Worker can't be nil!"
    end
    @worker = worker
  end
end