# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?


# Your code here


class Cookie
  attr_reader :flavor, :cookie_bake_time
  def initialize(flavor, bake_time)
    @flavor = flavor
    @cookie_bake_time = bake_time
  end
end

class Batch
  attr_reader :count, :flavor, :ready, :batch_bake_time
  def initialize(cookie, count)
    @count = count
    @cookies = Array.new(count, cookie)
    @flavor = cookie.flavor
  end

    #calculate_bake_time(cookie)

  def calculate_bake_time(cookie)
    @batch_bake_time = cookie.cookie_bake_time + @count / 10
  end
end

class Oven
  attr_reader :temperature

  def initialize
    @temperature = 325
    @time_baking = 0
  end

  def bake(batch_bake_time)
    @time_baking += 1 until @time_baking == batch_bake_time
    puts "The cookies have baked and they smell mmm mmm good!"
  end

end

choco_chip = Cookie.new("chocolate chip", 12)
p choco_chip
choco_chip_batch = Batch.new(choco_chip, 20)
#p choco_chip_batch
p choco_chip_batch.calculate_bake_time(choco_chip) == 14
p choco_chip_batch.flavor
oven = Oven.new
p oven.temperature == 325
oven.bake(14)
