class CoffeeMaker
  attr_reader :water_level, :cartridge

  def initialize(water_level = 0)
    @water_level = water_level
    @cartridge   = nil
  end

  def low_water?
    @water_level < 25
  end

  def cartridge_empty?
    !@cartridge
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
    return 100 - @water_level if amount == "fill" || amount == "Fill" || amount == "FILL"
    return 0 if amount < 0
    amount
  end

  def add_water(amount = "fill")
    amount_added = water_amount_validate(amount) 
    puts "Adding #{amount_added}% water to container."
	  @water_level =  @water_level + amount_added
    overflow_container if overflow?
    print_coffee_maker_status
    self
  end

  def add_cartridge(flavor = "Dark roast")
    puts "Adding #{flavor} cartridge."
    @cartridge = flavor
    print_coffee_maker_status
    self
  end

  def print_brew_messages
    puts "Cannot brew, please add water. Try again."            if low_water?
    puts "Cannot brew, please add cartridge. Try again."        if cartridge_empty?
    puts "Starting to brew your #{@cartridge} flavored coffee." unless low_water? || cartridge_empty?
    puts
  end

  def brew
    print_brew_messages
    brewing                    unless low_water? || cartridge_empty?
    use_ingredients
    print_coffee_maker_status
  end

  def use_ingredients
    @water_level -= 25
    @water_level = 0  if @water_level < 0
    @cartridge   = nil
  end

  def brewing
    puts "Your #{@cartridge} flavored coffee is ready. Enjoy!!!"
    puts
  end

  def to_s
    flavor = @cartridge ? @cartridge : "not inserted"
    "The water level is #{@water_level}% and the flavor cartridge is #{flavor}."
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

braun.add_cartridge("Hazel nut")

braun.brew

braun.add_cartridge("Pumpkin spice")

braun.add_water("fill")

braun.add_water(50)

braun.brew
