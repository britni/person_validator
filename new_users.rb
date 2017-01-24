require 'CSV'

class Users
  attr_reader :data
  def initialize(filename)
    @data = CSV.read(filename)
  end
end
