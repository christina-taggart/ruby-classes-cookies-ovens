# Answer These Questions:

# - What are essential classes?
   #Cookie, Oven
# - What attributes will each class have?
   #Cookies: Flavor, calories, time to cook, diameter, cooking temperature,
   #Ovens: Capacity, Temperature, in_oven?, available_space, baking?
# - What interface will each class provide?
   #
# - How will the classes interact with each other?
   # Cookies will go into ovens
# - Which classes will inherit from others, if any?
     # Types of cookies will inherit traits they all share from the master cookie class


# Your code here

class Cookies
  attr_accessor :flavor, :calories, :time_to_cook, :diameter, :cooking_temperature
  def initialize(flavor, calories, time_to_cook, diameter, cooking_temperature)
    @flavor = flavor
    @calories =
    @
    @
    @
  end
end

class ChocolateChip < Cookies
  def initialize
    super
  end
end

class ChocolateChip < Cookies
end

class ChocolateChip < Cookies
end

