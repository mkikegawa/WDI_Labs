require 'pry'

class VendingMachine
	attr_reader :price, :quantity
	def initialize(quantity = 100, price = 75)
		@price            = price
		@quantity         = quantity
		@amount_deposited = 0
	end

	def quarter
		@amount_deposited += 25
	end 

	def dime
		@amount_deposited += 10
	end

	def nickel
		@amount_deposited += 5
	end

	def return_change_to_user
		@amount_deposited - @price
 	end

 	def dispense_cola
 		@quantity -= 1
 	end

 	def insufficient_deposited?
 		@amount_deposited < @price
 	end

 	def sold_out?
 		@quantity < 1
 	end

 	def complete_sale
 		change = return_change_to_user
    dispense_cola
    @amount_deposited = 0
		["HackerCola", change]
 	end

 	def purchase_messages
 		return ["Please enter #{@price - @amount_deposited}"] if insufficient_deposited?
 		return ["Sold Out", @amount_deposited]                if sold_out?
 		return complete_sale
 	end

	def purchase
		purchase_messages
  end

  def to_s
  	"HackerCola:  quantity=#{@quantity}, price=#{@price}, amount_deposited=#{@amount_deposited}"
	end
end


vending_machine = VendingMachine.new(100, 75)

puts vending_machine               # HackerCola: quantity=100, price=75, amount_deposited=0
vending_machine.nickel
vending_machine.dime
vending_machine.quarter
puts vending_machine               # HackerCola: quantity=100, price=75, amount_deposited=40
puts vending_machine.purchase.to_s # ["Please enter 35 cents."]

vending_machine.nickel
vending_machine.dime
vending_machine.quarter
puts vending_machine.purchase.to_s # ["HackerCola", 5]
puts vending_machine
