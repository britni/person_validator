require 'CSV'

class Users
  attr_reader :data, :phone, :join, :email, :main
  def initialize(filename)
    @data = CSV.read(filename)
    @phonearray = []
    @joinarray = []
    @emailarray = []
  end

  def phone
    data.select {|x| x[4].match(/\d{3}-\d{3}-\d{4}/)}
    #phonearray = []
    #data.each do |x|
    #phonearray << x.select {|x| x[4].match(/\d{3}-\d{3}-\d{4}/)}
    #end
    #p phonearray
  end

  def join
    data.select {|x| x[1].match(/^(\d|[0][0-9]|[1][012])[\/-](\d|[012][0-9]|30|31)[\/-]((20)((0)[0-9]|(1)[0-7])|(19)[5-9][0-9])$/)}
    #joinarray = []
    #data.each do |x|
    #joinarray << x[1].match(/^(\d|[0][0-9]|[1][012])[\/-](\d|[012][0-9]|30|31)[\/-]((20)((0)[0-9]|(1)[0-7])|(19)[5-9][0-9])$/)
    #end
    #p joinarray
  end

  def email
    data.select {|x| x[3].match(/^(\w+|\w+[\.-_]\w+)@\w+\.(com|net|org|io|co)$/)}
    #emailarray = []
    #data.each do |x|
    #  emailarray << x[3].match(/^(\w+|\w+[\.-_]\w+)@\w+\.(com|net|org|io|co)$/)
    #end
    #p emailarray
  end

  def rownumber
    CSV.foreach(filename).with_index do |row, i|
      puts i
    end
  end

  def validity
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
p valid_users = user.data.collect{|x| x[0]} - invalid_phones - invalid_join - invalid_email
