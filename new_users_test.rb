require 'minitest/autorun'
require 'minitest/pride'
require './new_users.rb'

class NewUsersTest < Minitest::Test
  def test_initialize
    assert Users.new('homework.csv')
  end

  def test_phone
    user = Users.new('homework.csv')
    refute_equal ['919-111-1111', '000-000-0000'], user.phone.collect {|x| x[4]}
  end

  def test_join
    user = Users.new('homework.csv')
    assert_equal ['1/1/16', '2016-02', '13/03/2016', '442016', '2016-07-07', 'Yesterday'], user.join.collect {|x| x[1]}
  end

  def test_email
    user = Users.new('homework.csv')
    refute_equal ['amy@amy.com', 'e23@compuserve.net', 'me@prodigy.com', 'iloveninja@turtles.io'], user.email.collect {|x| x[3]}
  end

  def test_valid_users
    user = Users.new('homework.csv')
    assert_equal [], user.valid_users.collect {|x| x[0]}
  end
end
