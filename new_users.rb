require 'CSV'

class Users
  attr_reader :data, :phone, :join, :email, :main
  def initialize(filename)
    @data = CSV.read(filename) - [CSV.read(filename)[0]]
    @phonearray = []
    @joinarray = []
    @emailarray = []
  end

  def phone
    data.select {|x| x[4] !~ /\d{3}-\d{3}-\d{4}/}
  end

  def join
    data.select {|x| x[1] !~ /^(\d|[0][0-9]|[1][012])[\/-](\d|[012][0-9]|30|31)[\/-]((20)((0)[0-9]|(1)[0-7])|(19)[5-9][0-9])$/}
  end

  def email
    data.select {|x| x[3] !~ /^(\w+|\w+[\.-_]\w+)@\w+\.(com|net|org|io|co)$/}
  end

  def rownumber
    CSV.foreach(filename).with_index do |row, i|
      puts i
    end
  end

  def valid_users
    data - phone - join - email - data[0]
  #p emailarray.select {|x| x !=nil}
  # get the entire csv and remove all the ones that don't match
  #data - data.phone - data.join - data.email
  end
end

 user = Users.new('homework.csv')
 #valid_users = ((user.data - user.phone - user.join - user.email).collect {|x| x[0]}) - user.data[0]
 #puts "There are #{valid_users.length} valid users. They include #{valid_users}."

#invalid phones
invalid_phones = (user.data - user.phone).collect {|x| x[0]} - user.data[0]
puts "Invalid phones include #{invalid_phones}"

#invalid join
invalid_join = ((user.data - user.join).collect {|x| x[0]}) - user.data[0]
puts "Invalid dates include #{invalid_join}"

#invalid email
invalid_email = ((user.data - user.email).collect {|x| x[0]}) - user.data[0]
puts "Invalid emails include #{invalid_email}"

p invalid_email
p valid_users = user.data.collect{|x| x[0]} - invalid_phones - invalid_join - invalid_email - user.data[0]
p valid_users.count

puts CSV.read('homework.csv').count

p user.valid_users

p user.data - [user.data[0]]
