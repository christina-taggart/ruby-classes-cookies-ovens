class Oven
  attr_reader :cookies_tray
  def initialize
    @cookies_tray = []
    @baked = false
  end
  def insert_cookies(batch)
    @cookies_tray << batch
  end
  def bake_cookies
    @cookies_tray.each do |cookie|
      p cookie
    end
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

class Batch
  def initialize
    p "What types of cookies would you like to make?"
    p "Your choices are: "
    p "Chocolate Chip"
    p "and Fake cookie"
    @input = gets.split(" ")
    @batch = Array.new
    @our_oven = Oven.new
    @input.each do |cookie_type|
      @batch << Cookie.new(cookie_type)
    end
    @our_oven.insert_cookies(@batch)
    @our_oven.bake_cookies
    @our_oven.serve
  end
end

Batch.new