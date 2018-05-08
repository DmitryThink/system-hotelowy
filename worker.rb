require './maid.rb'
require './cook.rb'
class Worker

  def initialize(name, surname, tel = nil, email = nil)
    @name = name
    @surname = surname

    if !tel.nil?
      addMaid(tel)
    end

    if !email.nil?
      addCook(email)
    end
  end

  def addMaid(tel)
    if !@maid.nil?
      @maid.deleteWorker
    end
    maid = Maid.new(self, tel)
    @maid = maid
  end

  def addCook(email)
    if !@cook.nil?
      @cook.deleteWorker
    end
    cook = Cook.new(self, email)
    @cook = cook
  end

  def getSalary
    throw "getSalary abstract!"
  end
end