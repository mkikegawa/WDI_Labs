require 'pry'
require "./lib/person"

class Author < Person
  def initialize
    @name          = "Martin Kikegawa"
    @address       = "6146 Wagener Road"
    @city          = "Wagener"
    @state         = "SC"
    @zipcode       = 29164
    @email         = "mkikegawa@gmail.com"
    @phone         = "803-617-8745"
  end
end