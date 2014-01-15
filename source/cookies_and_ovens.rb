class Cookie
 attr_reader :status, :cooking_time
  def initialize(type, cooking_time)
    @cooking_time = cooking_time
    @type = type
    @status = :doughy
  end

  def heat_up(time)
    @cooking_time -= time
    if @cooking_time < 0
      @status = :burned
    elsif @cooking_time == 0
      @status = :ready
    elsif @cooking_time < 5
      @status = :almost_ready
    else
      @status = :doughy
    end
  end
end

class ChocolateChip < Cookie
  def initialize
    super("Chocolate", 20)
  end
end

class Peanutbutter < Cookie
  def initialize
    super("Peanutbutter", 15)
  end
end

class Sugar < Cookie
  def initialize
    super("Sugar", 25)
  end
end


class Oven
  attr_accessor :tray
  def initialize
    @tray = []
  end

  def cook(time)
    @tray.flatten.each {|cookie| cookie.heat_up(time)}
  end

  def status_check
    find_cookies(:doughy)
    find_cookies(:almost_ready)
    find_cookies(:ready)
    find_cookies(:burned)
  end

  def find_cookies(state)
    number_found = @tray.flatten.find_all {|cookie| cookie.status == state}.length
    puts "There are #{number_found} cookies that are #{state.to_s}"
  end
end

class Person
  attr_reader :plate
  def initialize
    @plate = []
    @baking_sheet = []
  end

  def remove(oven, number)
    @plate << oven.tray.pop(number)
  end

  def get_dough(number, cookie_type)
    number.times {@baking_sheet << cookie_type.new}
  end

  def insert(oven)
    oven.tray << @baking_sheet.pop(@baking_sheet.length)
  end
end

my_oven = Oven.new
andy = Person.new

puts "With Chocolate Chip"

andy.get_dough(10, ChocolateChip)

andy.insert(my_oven)

my_oven.cook(20)

my_oven.status_check

andy.remove(my_oven, 10)

##########

puts "With Peanut Butter"

andy.get_dough(10, Peanutbutter)

andy.insert(my_oven)

my_oven.cook(20)

my_oven.status_check

andy.remove(my_oven, 10)













