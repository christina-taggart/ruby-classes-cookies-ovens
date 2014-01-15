# Answer These Questions:

# - What are essential classes? cookies & ovens
# - What attributes will each class have? cookies - doneness, diameter, type, baking time
# ovens - current temperature. set temperature,
# - What interface will each class provide? place /remove food from oven, loook at food in oven
# - How will the classes interact with each other? put cookies in oven. when cookies are in oven for a long time, doneness ++
# - Which classes will inherit from others, if any? special cookies will inherit from base cookie if needed


# Your code here

class Cookies

  def initialize(diameter=3, type="chocolate chip")
    @doneness = "uncooked"
    @diameter = diameter
    @type = type
  end


end



class Oven
  attr_reader :rack
  def initialize
    @current_temp = 70
    @set_temp = 70
    @rack = []
  end

  def insert_cookies(batch)
    @rack.push(batch)

  end

  def remove_cookies(batch)
    @rack.delete(batch)
  end


end
cookie_batch =[]
12.times {cookie_batch << Cookies.new}

p cookie_batch.inspect
# yum = Cookies.new
# p yum.inspect

my_oven = Oven.new

my_oven.insert_cookies(cookie_batch)
p my_oven.inspect
my_oven.remove_cookies(cookie_batch)
p my_oven.rack.length == 0












