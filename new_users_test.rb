require 'minitest/autorun'
require 'minitest/pride'
require './new_users.rb'

class NewUsersTest < Minitest::Test
  def test_initialize
    assert Users.new('homework.csv')
  end

  def test_phone
    user = Users.new('homework.csv')
    assert_equal ['9192223333', '(919)333-444', '919.444.5555', '(1)2-3', '(919) 555-6666'], user.phone.collect {|x| x[4]}
  end

  def test_join
    user = Users.new('homework.csv')
    assert_equal ['1/1/16', '2016-02', '13/03/2016', '442016', '2016-07-07', 'Yesterday'], user.join.collect {|x| x[1]}
  end

  def test_email
    user = Users.new('homework.csv')
    assert_equal ['bob@bob@bob.com', 'cindy@cindy', 'dan-dan.dan@dan.dan.com'], user.email.collect {|x| x[3]}
  end

  def test_valid_users
    user = Users.new('homework.csv')
    #assert_equal [], user.valid_users.collect {|x| x[0]}
    assert_equal 0, user.valid_users
  end
end
