# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?


# Your code here
module Oven
  def ready_to_remove?
    @baked
  end

  def bake!
    @baked = true
  end
end

class Cookie
  include Oven
  attr_reader :flavor, :in_oven
  def initialize(flavor)
    @flavor = flavor
    @in_oven = false
    @baked = false
  end

  def put_in_oven
    puts "You put some #{@flavor} cookies in the oven."
  end

  def remove_from_oven
    puts "You removed some #{@flavor} cookies from the oven."
  end
end

class ChocoChip < Cookie
  def initialize
    super("Chocolate chip")
  end
end

choc_chip = ChocoChip.new
choc_chip.put_in_oven
choc_chip.bake!
choc_chip.remove_from_oven

class PeanutButter < Cookie
  def initialize
    super("Peanut Butter")
  end
end

class SnickerDoodle < Cookie
  def initialize
    super("Snickerdoodle")
  end
end

