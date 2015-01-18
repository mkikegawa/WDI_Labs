class Pet
# this block is replaced with attr_accessor
  # attr_reader :name, :age
  # attr_writer :age
# this block is replaced with attr_accessor	
  attr_reader :name
  attr_accessor :age


  def initialize(name, type, age)
    @name = name
    @type = type
    @age  = age
  end

# this block is replaced with attr_accessor
## this block is replaced with attr_writer
### def age=(age)
### 	@age = age
### end
## this block is replaced with attr_writer 

## this block is replaced with attr_reader 
### def name
### 	@name
### end
###
### def age
### 	@age
### end
## this block is replaced with attr_reader 
# this block is replaced with attr_accessor

  def inc_age 
    @age += 1
  end 

  def to_s
    "#{@name} is a #{@age} year old #{@type}"
  end
end

miko = Pet.new("Miko", "Dog", 2)
puts miko

miko.inc_age
puts "The name of my dog is #{miko.name}"
puts "My dog is #{miko.age} years old."

ginger = Pet.new("Ginger", "Cat", 7)
puts ginger
