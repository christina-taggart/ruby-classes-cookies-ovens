# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?


# Your code here


class Cookie
  attr_reader :flavor, :cookie_bake_time, :doughy, :almost_ready, :ready, :burned
  def initialize(flavor, bake_time)
    @flavor = flavor
    @cookie_bake_time = bake_time
    @doughy = false
    @almost_ready = false
    @ready = false
    @burned = false
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

  def bake(batch)
    @time_baking += 2
    if @time_baking <= 3
      batch.doughy = true
    elsif @time_baking <= 11#@time_remaining - 1
      batch.almost_ready = true
    elsif @time_baking == 12 #@time_remaining
      batch.ready = true
      puts "smells mmmmmmm mmmmm good"
    else
      batch.burned = true
    end
  end

  # def status_of_cookies
  #   if @time_baking <= 3
  #     @doughy = true
  #   elsif @time_baking <= 11#@time_remaining - 1
  #     @almost_ready = true
  #   elsif @time_baking == 12 #@time_remaining
  #     @ready = true
  #     puts "smells mmmmmmm mmmmm good"
  #   else
  #     @burned = true
  #   end
  # end

  def check_cookies_in_oven(batch)

    if @time_baking <= 3
      puts "The cookies are doughy and need to bake much longer."
    elsif @time_baking <= batch.batch_bake_time
      puts "Just a minute longer..."
    elsif @time_baking == batch.batch_bake_time
      puts "Take the cookies out now!"
    elsif @time_baking > batch.batch_bake_time
      puts "Oh dear, the cookies have been baked to a crisp!"
    end
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
oven.bake(choco_chip_batch)
p oven.check_cookies_in_oven(choco_chip_batch)
oven.bake(choco_chip_batch)
p oven.check_cookies_in_oven(choco_chip_batch)
6.times do oven.bake(choco_chip_batch) end
p oven.check_cookies_in_oven(choco_chip_batch)
p oven.check_cookies_in_oven(choco_chip_batch)


