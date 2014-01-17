# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?


# Your code here
# class Oven
#         @@ready = false
#         def bake!
#                 @@ready = true
#         end
#         def ready?
#                 @@ready
#         end
# end

# class Cookie < Oven
#         def initialize(cookie_type)
#                 @type = cookie_type
#         end
#         def make_cookie
#                 self.bake!
#                 self.ready?
#                 p "Your #{@type} cookie is ready!"
#         end
# end

# oven = Oven.new
# choc_chip = Cookie.new("Chocolate Chip")
# choc_chip.make_cookie


# Nouns
# - Cookies (types are included)
# - Oven
# - Batch

# VERBS
# - make (cookies)
# - bake
# - remove
# - place (insert)

# Oven
# Methods - bake, place, remove
# Attributes - timer?,

# Cookie
# Methods - make (initialize), place?, bake?
# Attributes - type,
# when to remove the cookie?

# the oven holds cookies

# INHERITANCE
# "IS A"   -   A BAT IS A MAMMAL, A bus is a vehicle, An orange is a fruit
#
# COMPOSITION
# "HAS A"  - A bike has gears,  A tree has oranges,
# Oven has cookies
# Batch has cookies
#
# class OrangeTree
#    def initialize
#             @oranges = []
#    end
#    def grow
#       # make new oranges
#    end
# end


class Oven
  def initialize
    @cookies_tray = []
    @baked = false
  end
  def insert_cookies(cookie)
    @cookies_tray << cookie
  end
  def bake_cookies(cookie)
    unless cookie.doneness == true
      cookie.done?
    end
  end
  def remove
    @cookies_tray
  end
  def serve
    @cookies_tray.each do |cookie|
      p "Your #{cookie.cookie_type} is ready to eat"
    end
  end
end

class Cookie
  attr_reader :doneness, :cookie_type
  def initialize(type_of_cookie)
    @cookie_type = type_of_cookie
    @doneness = false
  end
  def done?
    @doneness = true
  end
end

# class MakeCookies
#   def make

#   end
# end


oven = Oven.new
cookie = Cookie.new("Chocolate Chip")
oven.insert_cookies(cookie)  # need to initialize a cookie
oven.bake_cookies(cookie)   # maybe a destructive method?
oven.remove
oven.serve
