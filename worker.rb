require './maid.rb'
require './cook.rb'
require './maid_cookier.rb'
class Worker
  def initialize(name, surname, gender, tel = nil, email = nil)
    @name = name
    @surname = surname
    @gender = gender

    if !tel.nil? && !email.nil?
      addMaidCookier(tel,email)
    else
      if !tel.nil?
        addMaid(tel)
      end

      if !email.nil?
        addCook(email)
      end
    end
  end


  def setGender(gender)
    if(gender.nil?)
      throw "Gender can't be nil!"
    end
    @gender = gender
  end

  #Overlapping
  def addMaid(tel)
    if !@maid.nil?
      @maid.deleteWorker
    end
    if !@cook.nil?
      addMaidCookier(tel, @cook.getEmail)
    end
    maid = Maid.new(self, tel)
    @maid = maid
  end

  def addCook(email)
    if !@cook.nil?
      @cook.deleteWorker
    end
    if !@maid.nil?
      addMaidCookier(@maid.getTel, email)
    end
    cook = Cook.new(self, email)
    @cook = cook
  end

  def deleteMaid
    @maid = nil
  end

  def deleteCook
    @cook = nil
  end
  #Overlapping

  def deleteMiadCookier
    @maidCookier = nil
  end

  def addMaidCookier(tel,email)
    if tel.nil? && email.nil?
      throw "Tel and Email can't be nil!"
    end
    if(!@maidCookier.nil?)
      @maidCookier.deleteWorker
    end
    maidCookier = MaidCookier.new(self, tel, email)
    @maidCookier = maidCookier
  end

  def getSalary
    throw "getSalary abstract!"
  end

  def getCook
    @cook
  end

  def getMaid
    @maid
  end

  def getMiadCookier
    @maidCookier
  end

  def getName
    @name
  end

  def getSurname
    @surname
  end

  def whoIAm
    string = "I'm "
    if !@maid.nil? && !@cook.nil?
      string = string + " MaidCookier"
    elsif !@maid.nil?
      string = string + " Maid"
    elsif !@cook.nil?
      string = string + " Cook"
    else
      string = string + " Worker"
    end
    string
  end
end