# Answer These Questions:

# - What are essential classes?
  #bakery
  #batch
# - What attributes will each class have?
  #cookeie dough
  #batch count
  #---
  #cookie count
# - What interface will each class provide?
  #public
# - How will the classes interact with each other?
  #each batch will be part of the bake method of the bakery
# - Which classes will inherit from others, if any?
  #NONE


# Your code here

class Bakery

  def initialize(pounds_of_dough)
    @cc_dough = pounds_of_dough[0]
    @cc_cookies = 0
    @cc_bake_time = 20

    @pb_dough = pounds_of_dough[1]
    @pb_cookies = 0
    @pb_bake_time = 40

    @cashmoney = 0
  end

  def place_in(cookie_type)
    puts "#{cookie_type} cookies are now in the oven"
    if cookie_type == "Chocolate Chip"
      @cc_dough -= 1
    elsif cookie_type == "Peanut Butter"
      @pb_dough -= 1
    end
  end

  def bake(cookie_type)
    if cookie_type == "Chocolate Chip"
      puts "Your Chocolate Chip cookies are baking for #{@cc_bake_time} minutes."
    elsif cookie_type == "Peanut Butter"
      puts "Your Peanut Butter cookies are baking for #{@pb_bake_time} minutes."
    end

  end

  def check(cookie_type, min_baked_already)
    if cookie_type == "Chocolate Chip"
      case
        when min_baked_already <= (@cc_bake_time/4)
          "Doughy"
        when min_baked_already.between?(@cc_bake_time/4, @cc_bake_time)
          "Almost Ready"
        when min_baked_already == @cc_bake_time
          "Ready"
        when min_baked_already > @cc_bake_time
          "Burned"
        end
    elsif cookie_type == "Peanut Butter"
      case
        when min_baked_already <= (@pb_bake_time/4)
          "Doughy"
        when min_baked_already.between?(@pb_bake_time/4, @pb_bake_time)
          "Almost Ready"
        when min_baked_already == @pb_bake_time
          "Ready"
        when min_baked_already > @pb_bake_time
          "Burned"
        end
    end
  end

  def take_out(cookie_type)
    puts "#{cookie_type} cookies are now ready"
    if cookie_type == "Chocolate Chip"
      @cc_cookies += 10
    elsif cookie_type == "Peanut Butter"
      @pb_cookies += 10
    end
  end

  def sell(sale_id)
    @cashmoney += sale_id.revenue
    @cc_cookies -= sale_id.cc_cookie_count
    @pb_cookies -= sale_id.pb_cookie_count
  end

  def display
    puts "We have #{@cc_cookies} chocolate chip cookies and #{@cc_dough} pounds of chocolate chip cookie dough."
    puts "We have #{@pb_cookies} peanut butter cookies and #{@pb_dough} pounds of peanut butter cookie dough."
    puts @cashmoney
  end


end


# class Batch
# end

class Sales

  attr_reader :revenue, :cc_cookie_count, :pb_cookie_count

  def initialize(revenue, cookie_count)
    @revenue = revenue
    @cc_cookie_count = cookie_count[0]
    @pb_cookie_count = cookie_count[1]
  end

end




my_bakery = Bakery.new([10,20])
my_bakery.place_in("Chocolate Chip")
my_bakery.bake("Chocolate Chip")
my_bakery.bake("Peanut Butter")
p my_bakery.check("Chocolate Chip", 5)
p my_bakery.check("Chocolate Chip", 15)
p my_bakery.check("Chocolate Chip", 20)

p my_bakery.check("Peanut Butter", 5)
p my_bakery.check("Peanut Butter", 25)
p my_bakery.check("Peanut Butter", 50)

my_bakery.take_out("Chocolate Chip")
my_bakery.place_in("Peanut Butter")
my_bakery.take_out("Peanut Butter")
my_bakery.sell(Sales.new(20, [5,7]))


my_bakery.display




