# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?


# Your code here
class Oven
  attr_reader :cookie_batches, :full, :timer
  def initialize
    @cookie_batches = []
    @full = false
    @timer = 0
  end

  def bake!
    "Baking some #{cookie_batches.join(" and ")} cookies."
  end

  def put_in_oven(cookie)
    puts "You put some #{cookie.flavor} cookies in the oven."
  end

  def remove_from_oven(cookie)
    puts "You removed some #{cookie.flavor} cookies from the oven."
  end

  def check_time
    @timer+=5
    puts "Cookies have been baking for #{@timer} minutes."
    @cookie_batches.map!{|cookie| Cookie.time_baked += 5}
  end

  def cookie_state(cookie)
    cookie_doughy?(cookie)
    cookie_almost_ready?(cookie)
    cookie_ready?(cookie)
    cookie_burned?(cookie)
  end

end

class Cookie
  attr_accessor :flavor, :in_oven, :doughy, :almost_ready, :ready, :burned, :baking_time, :time_baked
  def initialize(flavor)
    @flavor = flavor
    @in_oven = false
    @baking_time = 30
    @time_baked = 0
    @doughy = (@time_baked < @baking_time/3)
    @almost_ready = @time_baked.between?(@baking_time/3, @baking_time/2)
    @ready = @time_baked == @baking_time
    @burned = @time_baked > @baking_time
  end
end

class ChocoChip < Cookie
  def initialize
    super("Chocolate chip")
    @baking_time = 40
  end
end

class PeanutButter < Cookie
  def initialize
    super("Peanut Butter")
    @baking_time = 35
  end
end

class SnickerDoodle < Cookie
  def initialize
    super("Snickerdoodle")
    @baking_time = 42
  end
end

oven = Oven.new
choc_chip = ChocoChip.new
snickerdoodle = SnickerDoodle.new
oven.put_in_oven(choc_chip)
oven.put_in_oven(snickerdoodle)
oven.bake!
oven.check_time
oven.check_time
oven.check_time
oven.check_time
p choc_chip.time_baked
p snickerdoodle.time_baked
