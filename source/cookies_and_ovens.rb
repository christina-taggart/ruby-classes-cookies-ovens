# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?


# Your code here
class Oven

  def initialize(batch, tempature = 400)
    @tempature = tempature
    @bake_time = 0
    @batch = batch
  end

  def bake!
    set_bake_time
    @bake_time.times{ one_min_passes }
    puts "You baked #{@batch.length} cookies for #{@bake_time} mins!"
  end

  private

  def one_min_passes
    @batch.each{ |cookie| cookie.mins_cooked += 1 }
  end

  def set_bake_time
    @bake_time = bake_time_average
  end

  def bake_time_average
    @batch.map{ |cookie| cookie.bake_time }.reduce(:+) / @batch.length
  end

end

class Cookie
  attr_reader :bake_time, :ingredients
  attr_accessor :mins_cooked
  @@batch = []

  def initialize(bake_time, ingredients)
    @bake_time = bake_time
    @ingredients = ingredients
    @mins_cooked = 0
  end

  def self.batch
    @@batch
  end

  def add_to_batch
    @@batch << self
  end
end

class PeanutButterCookie < Cookie
  def initialize(bake_time = 10, ingredients = ["peanuts", "butter", "cookie"])
    super
    @name = "Peanut Butter"
  end


end

class SugarCookie < Cookie
  def initialize(bake_time = 8, ingredients = ["sugar", "cookie"])
    super
    @name = "Sugar"
  end
end

class ChocolateChipCookie < Cookie
  def initialize(bake_time = 12, ingredients = ["chocolate", "chip", "cookie"])
    super
    @name = "Chocolate Chip"
  end

end

peanut = PeanutButterCookie.new
peanut.add_to_batch
peanut2 = PeanutButterCookie.new
peanut2.add_to_batch
choco = ChocolateChipCookie.new
choco.add_to_batch
sugar = SugarCookie.new
sugar.add_to_batch
3.times{
sugar = SugarCookie.new
sugar.add_to_batch
}
Cookie.batch

convection = Oven.new(Cookie.batch)
convection.bake!