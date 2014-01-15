# Answer These Questions:

# - What are essential classes? cookies & ovens
# - What attributes will each class have? cookies - doneness, diameter, type, baking time
# ovens - current temperature. set temperature,
# - What interface will each class provide? place /remove food from oven, loook at food in oven
# - How will the classes interact with each other? put cookies in oven. when cookies are in oven for a long time, doneness ++
# - Which classes will inherit from others, if any? special cookies will inherit from base cookie if needed


# Your code here

class Cookie
  DONENESS_STATES = [:doughy, :almost_ready, :ready, :burned]

  def initialize(diameter=3, type="chocolate chip", baking_time=10)
    @diameter = diameter
    @type = type
    @baking_time = baking_time
    @doneness = 0
  end

  def cook
    @doneness +=1 if @doneness < DONENESS_STATES.length-1
  end

  def doneness
    DONENESS_STATES[@doneness]
  end


end


class MacadamiaCookie < Cookie
  def initialize
    super(3, "Macadamia", 5)
  end

end

class OatmealCookie < Cookie
  def initialize
    super(3, "Oatmeal", 8)
  end
end

class SugarCookie < Cookie
  def initialize
    super(3, "Sugar", 7)
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

  def cook
    if @rack.length != 0
      @rack.each do |batch|
        batch.each do |cookie|
          cookie.cook
        end
      end
    end
  end


end
cookie_batch =[]
12.times {cookie_batch << Cookie.new}

macadamia_batch = []
12.times {macadamia_batch << MacadamiaCookie.new}

oatmeal_batch = []
12.times {oatmeal_batch << OatmealCookie.new}

sugar_batch = []
12.times {sugar_batch << SugarCookie.new}


p cookie_batch.inspect


my_oven = Oven.new

my_oven.insert_cookies(cookie_batch)
p my_oven.inspect
my_oven.remove_cookies(cookie_batch)
p my_oven.rack.length == 0


my_oven.insert_cookies(oatmeal_batch)
my_oven.insert_cookies(sugar_batch)
my_oven.insert_cookies(macadamia_batch)

my_oven.remove_cookies(sugar_batch)

p my_oven.rack[0].first.doneness == :doughy
my_oven.cook
p my_oven.rack[0].first.doneness == :almost_ready
my_oven.cook
p my_oven.rack[0].first.doneness == :ready









