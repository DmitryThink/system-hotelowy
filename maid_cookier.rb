require './cook.rb'
require './i_maid.rb'
require './maid.rb'

class MaidCookier < Cook
  include IMaid

  @salary = 40
  def initialize(worker, name, surname, tel, email)
    @name = name
    @surname = surname
    @tel = tel
    @maid = Maid.new(worker, email)
  end

  def getSalary
    40
  end

  def getEmail
    @email
  end

  def getTel
    @tel
  end

  def getEmailAndTel
    @email + ' ' + @tel
  end
end