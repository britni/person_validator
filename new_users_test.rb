require 'minitest/autorun'
require 'minitest/pride'
require './new_users.rb'

class NewUsersTest < Minitest::Test
  def test_initialize
    assert Users.new('homework.csv')
  end
end
