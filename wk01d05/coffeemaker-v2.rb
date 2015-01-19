require 'pry'

class Cartridge
  AVAIABLE_COFFEE_TYPES = [
    { name: "Dark Roast",    time_brew_in_sec: 60, water_required: 35 },
    { name: "Regular Grind", time_brew_in_sec: 80, water_required: 25 },
    { name: "Cappuccino",    time_brew_in_sec: 30, water_required: 15 },		
    { name: "Iced Coffee",   time_brew_in_sec: 20, water_required: 70 }
  ]

  attr_reader    :name, :time_brew_in_sec, :water_required, :cartridge_empty
  def initialize(selected = "Regular Grind")
    @selected         = selected
    @name             = nil
    @time_brew_in_sec = nil
    @water_required   = nil
    @cartridge_empty  = true
  end

  def grind_coffee
    AVAIABLE_COFFEE_TYPES.detect { |type| type[:name].downcase == @selected.downcase }
  end

  def not_ground?
    !grind_coffee
  end

  def cartridge_fail
    puts "#{ @selected } is not available."
    @name = "NA"  
  end

  def make_cartridge
    cartridge_fail if not_ground?
    fill_cartridge unless not_ground?
    self
  end

  def cartridge_empty?
    @cartridge_empty
  end

  def water_required
    @water_required
    self
  end

  def fill_cartridge
    coffee            = grind_coffee
    @name             = coffee[:name]
    @time_brew_in_sec = coffee[:time_brew_in_sec]
    @water_required   = coffee[:water_required]
    @cartridge_empty  = false
  end

  def brew
    @cartridge_empty = true
  end
end

### irb command line copy from list
# cart = Cartridge.new
# cart.make_cartridge
# cart.name
# cart.time_brew_in_sec
# cart.water_required
# cart.cartridge_empty?
# cart2 = Cartridge.new("Iced Coffee")
# cart2.make_cartridge
# cart2.name
# cart2.time_brew_in_sec
# cart2.water_required
# cart2.cartridge_empty?
# cart3 = Cartridge.new("IJoey")
# cart3.make_cartridge
# cart3.name
# cart3.time_brew_in_sec
# cart3.water_required
# cart3.cartridge_empty?
# cart4 = Cartridge.new("cappuccino")
# cart4.make_cartridge
# cart4.name
# cart4.time_brew_in_sec
# cart4.water_required
# cart4.cartridge_empty?
############


class CoffeeMaker
  attr_reader :water_level, :cartridge

  def initialize(water_level = 0)
    @water_level          = water_level
    @cartridge            = nil
    @cartridge_installed  = nil
  end

  def water_used
    return 25      if @cartridge_installed
    return @cartridge.water_required
  end

  def low_water?
    @water_level < water_used
  end

  def cartridge_empty?
   !@cartridge_installed 
  end

  def overflow?
    @water_level > 100
  end

  def print_coffee_maker_status
    puts self.to_s
    puts
  end

  def overflow_container
    puts "Water overflowed container and splilled across the counter."
    @water_level = 100
  end

  def water_amount_validate(amount)
    return 100 - @water_level if amount == "fill" || amount == "FILL" || amount == "Fill"
    return 0 if amount < 0
    amount
  end

  def add_water(amount = "fill")
    amount_added = water_amount_validate(amount) 
    puts "Adding #{ amount_added }% water to container."
    @water_level += amount_added
    overflow_container if overflow?
    print_coffee_maker_status
    self
  end

  def cartridge_found?
    !@cartridge.name == "NA" 
  end

  def install_cartridge
    @cartridge_installed = true unless @cartridge.name == "NA"  
  end


  def add_cartridge(flavor = "Dark roast")
    @cartridge = Cartridge.new(flavor).make_cartridge
    install_cartridge                             
    puts "Adding #{ @cartridge.name } cartridge." unless cartridge_empty?
    print_coffee_maker_status
    self
  end

  def print_brew_messages  
    puts "Cannot brew, please add water. Try again."                                                if low_water? 
    puts "Cannot brew, please add cartridge. Try again."                                            if cartridge_empty? 
    puts "Please add water to #{ @cartridge.water_required - @water_level }% for minimum brew size" if low_water?       && @cartridge_installed
    puts "Starting to brew your #{ @cartridge.name } flavored coffee."                              unless low_water?   || cartridge_empty?   
  end

  def brew
    print_brew_messages
    brewing                    unless low_water? || cartridge_empty?
    use_ingredients
    print_coffee_maker_status
    self
  end

  def use_ingredients
    @cartridge    = nil    if @cartridge && !low_water?
    @water_level -= water_used
    @water_level  = 0      if @water_level < 0
  end

  def timer 
    puts "Your #{ @cartridge.name } flavored coffee will be ready in: "
    @cartridge.time_brew_in_sec.times { |time| puts "#{time + 1} second(s)"}
    puts
  end

  def brewing
    timer
    puts "Your #{ @cartridge.name } flavored coffee is ready. Enjoy!!!"
    puts
    puts "************************************************************"
    puts
  end

  def to_s
    flavor = @cartridge_installed ? @cartridge.name : "not inserted"
    "The water level is #{ @water_level }% and the flavor cartridge is #{ flavor }."
  end
end

braun = CoffeeMaker.new

braun.brew

braun.add_water(60)

braun.brew

braun.add_cartridge

braun.brew

braun.add_cartridge("Pumpkin spice")

braun.brew

braun.add_water(45)

braun.add_cartridge("cappuccino")

braun.brew

braun.add_cartridge("iced coffee")

braun.add_water("fill")

braun.add_water(50)

braun.brew
