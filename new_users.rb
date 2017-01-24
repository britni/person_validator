require 'CSV'

class Users
  attr_reader :data, :phonearray, :joinarray, :emailarray
  def initialize(filename)
    @data = CSV.read(filename)
    @phonearray = []
    @joinarray = []
    @emailarray = []
  end

  def phone
    phonearray = []
    data.each do |x|
    phonearray << x[4].match(/\d{3}-\d{3}-\d{4}/)
    end
    p phonearray
  end

  def join
    joinarray = []
    data.each do |x|
    joinarray << x[1].match(/\d{3}-\d{3}-\d{4}/)
    end
    p joinarray
  end

  def email
    emailarray = []
    data.each do |x|
    emailarray << x[3].match(/\d{3}-\d{3}-\d{4}/)
    end
    p emailarray
  end
end
