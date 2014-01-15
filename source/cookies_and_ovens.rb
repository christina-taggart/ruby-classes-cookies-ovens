# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?


# Your code here
class Oven
	@@ready = false
	def bake!
		@@ready = true
	end
	def ready?
		@@ready
	end
end

class Cookie < Oven
	def initialize(cookie_type)
		@type = cookie_type
	end
	def make_cookie
		self.bake!
		self.ready?
		p "Your #{@type} cookie is ready!"
	end
end

oven = Oven.new
choc_chip = Cookie.new("Chocolate Chip")
choc_chip.make_cookie