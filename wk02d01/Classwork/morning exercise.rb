require 'pry'

class Utopia
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def self.define
    puts "I am the bodiless notion of a near-perfect society."
    self
  end

  def define
    puts "I am #{name}, a tangible society that you can reach out and touch in which everyone is content." 
    self
  end

  def say_hello
    self.define
  end

  def say_hello_again
    define
  end
end
binding.pry
