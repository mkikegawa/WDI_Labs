require 'pry'

class Person
  def self.get_user_name
    puts "What's your name?"
    gets.chomp.capitalize
  end

  def self.get_address
    puts "What is your street address?"
    gets.chomp.to_s
  end

  def self.get_city
    puts"What city?"
    gets.chomp.to_s
  end

  def self.get_state
    puts "What state (abbreviated)?"
    gets.chomp.upcase
  end

  def self.get_zipcode
    puts "What is your zipcode?"
    gets.chomp.to_i
  end

  def self.get_email
    puts "What is your email?"
    get.chomp.to_s
  end

  def self.get_phone
    puts "What is your phone number?"
    get.chomp.to_s
  end

  attr_accessor  :name, :address, :city, :state, :zipcode, :email, :phone
  def initialize(args = {})
    @name          = args[:name]
    @address       = args[:address]
    @city          = args[:city]
    @state         = args[:state]
    @zipcode       = args[:zipcode]
    @email         = args[:email]
    @phone         = args[:phone]
  end
end