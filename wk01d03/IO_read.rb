require 'pry'

grocery_list  =IO.read("grocery_list.txt").split("\n")

2.times do
	grocery_list.shift
end

# grocery_list.each { |item| IO.write("new_grocery_list.txt", "#{item}\n")}
# new_grocery_list = grocery_list.join("\n")

IO.write("new_grocery_list.txt", grocery_list)
