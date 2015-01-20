class Animal # abstract - will never be instanced as it is
  def initialize
    @brain = true
    @legs  = 0
  end

  def has_brain?
    @brain
  end

  def leg_count
    @legs
  end
end

class Human < Animal
  def initialize
    super      # runs initialize in Anima, aka Human's super
    @legs = 2  # overwrites the @legs = 0 set by the super
  end
end

class Pet < Animal
  def initialize
    super
    @legs  = 4
    @fleas = 0
  end

  def flea_count
    @fleas
  end
end

class Dog < Pet
  def initialize
    super
    @fleas = 8
  end

  def has_brain?
    puts "No, he's an idiot. Hate that dog."
  end

  def speak
    "Woof"
  end
end

class Cat < Pet
  def initialize
    super
    @fleas = 4
  end

  def speak
    "Meow"
  end

end

me = Human.new
me.has_brain   # => true
me.leg_count   # => 0

my_pet = Pet.new
my_pet.has_brain? # => will return nothing if the variable was not initialize by super

maverick = Dog.new
squeaks  = Cat.new

puts squeaks.flea_count  # => 8
maverick.has_brain?

my_pets = [maverick, squeaks]
my_pets.each do |pet|
  puts pet.speak
end
