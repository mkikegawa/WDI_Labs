def greeting_to(name)
	puts "Hi #{name}, how are you?"
end

def get_user_name
	puts "What's your name?"
	user_name = gets.chomp
	return user_name
end

def five_squared 
  	return 5**2
end


user_name = get_user_name
greeting_to(user_name)

puts five_squared
