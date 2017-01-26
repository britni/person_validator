require 'minitest/autorun'
require 'minitest/pride'
require './new_users.rb'

class NewUsersTest < Minitest::Test
  def test_initialize
    assert Users.new('homework.csv')
  end

  def test_phone
    user = Users.new('homework.csv')
    #assert (user.phone.select {|x| x == nil}) == []
    assert_equal ['919-111-1111', '000-000-0000'], user.phone.collect {|x| x[4]}
  end

  def test_join
    user = Users.new('homework.csv')
    #assert (user.join.select {|x| x == nil}) == nil
    assert_equal ['2/3/2016'], user.join.collect {|x| x[1]}
  end

  def test_email
    user = Users.new('homework.csv')
    #assert (user.email.select {|x| x == nil}) == nil
    assert_equal ['amy@amy.com', 'e23@compuserve.net', 'me@prodigy.com', 'iloveninja@turtles.io'], user.email.collect {|x| x[3]}
  end

  def test_validity
    user = Users.new('homework.csv')
    p user.validity.rownumber
  end
end
