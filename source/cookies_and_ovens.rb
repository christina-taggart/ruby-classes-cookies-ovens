# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?


#-----COOKIE CLASSES-----

class Cookie
  def initialize
    @baked = false
    @baking_time = 1
  end

  def bake!
    @baking_time -= 1
    @baked = true if @baking_time == 0
  end

  def baked?
    @baked
  end
end

class PeanutButter < Cookie
  attr_reader :cookie_type, :baking_time
  def initialize
    super
    @cookie_type = "Peanut Butter"
    @baking_time = 3
  end
end

class ChocolateChip < Cookie
  attr_reader :cookie_type
  def initialize
    super
    @cookie_type = "Chocolate Chip"
    @baking_time = 5
  end
end

#-----BATCH CLASS-----

class Batch
  def initialize(cookie_array)
    @batch = cookie_array
  end

  def each
    @batch.each { |cookie| yield(cookie) }
  end

  def batch_baked?
    @batch.each { |cookie| return false if !cookie.baked? }
    true
  end
end

#-----OVEN CLASS-----

class Oven
  def initialize
    @batch = nil
  end

  def add_batch(batch)
    if @batch
      puts "The oven is full."
    else
      @batch = batch
    end
  end

  def remove_batch
    if self.empty?
      report_no_cookies
    else
      removed_batch = @batch
      @batch = nil
      removed_batch
    end
  end

  def bake_batch!
    if self.empty?
      report_no_cookies
    else
      puts "Baking the cookies..."
      @batch.each { |cookie| cookie.bake! }
    end
  end

  def check_batch
    if self.empty?
      report_no_cookies
    elsif @batch.batch_baked?
      puts "The batch is baked!"
    else
      puts "The batch is not ready yet."
    end
  end

  def empty?
    return @batch ? false : true
  end

  private

  def report_no_cookies
    puts "There are no cookies in the oven."
  end
end


#-----DRIVERS-----

my_batch = Batch.new([ChocolateChip.new, ChocolateChip.new, PeanutButter.new])
puts "Is my batch baked?: #{my_batch.batch_baked?}"

big_oven = Oven.new
big_oven.add_batch(my_batch)
big_oven.bake_batch!
big_oven.bake_batch!
big_oven.bake_batch!
big_oven.check_batch
big_oven.bake_batch!
big_oven.bake_batch!
puts big_oven.check_batch
my_batch = big_oven.remove_batch

puts "Is my batch baked?: #{my_batch.batch_baked?}"