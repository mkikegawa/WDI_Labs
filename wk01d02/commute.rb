# states 
# - hours of sleep
#  	 0 - 7 			 => Sleepy
#	 8 - 14 	     => Rested
#	 15 - 24 		 => Wired
# - Getting up
#    on time      	 => Ate breakfast  
#    missed alarm 	 => No Breakfast
# - weather
#    rain		     => rain coat
#    snow   		 => scarf + hat
#    fair			 => shorts
#    
#


puts "How many hours of sleep did you get?"
sleep = gets.chomp.to_i
#sleep = 15

case sleep
when 0..7
	puts "You are sleepy."
when 8..14
	puts "You are well rested."
when 15..24
	puts "You are wired."
end

puts "Did the alarm wake you up?[yn]"
q_wake = gets.chomp.downcase
#q_wake = "y"

#breakfast = q_wake == "y" ? true : false
#puts breakfast ? "You had breakfast." : "You did not have breakfast."

if q_wake == "y" 
	breakfast = true
    puts "You had a hearty breakfast."
else
	breakfast = false
	puts "You did not have time for breakfast."
end

puts "What is the weather like?[rain/snow/sunny]"
weather = gets.chomp
#weather = "other"

case weather
when "rain"
	clothes = "a rain coat"
when "snow"
	clothes = "a scarf and hat"
when "sunny"
	clothes = "shorts"
else 
	clothes = nil
end
puts "You look out the windows & decide you'd better put on #{clothes}." if clothes

puts "You walk like a mummy as you think about the coffee awaiting you in the classroom." if sleep <= 7 && breakfast
puts "You drag yourself along the sidewalk." if sleep <= 7 && !breakfast 
puts "You have a comfortable bounce in your step." if (sleep >= 8 && sleep <= 14) && breakfast 
puts "You decide you will have an apple as soon as you reach the classroom." if (sleep >= 8 && sleep <= 14) && !breakfast 
puts "You break into a run as soon as you get out the front door." if sleep >= 15 && breakfast 
puts "You stop off at Chipotle and order the biggest burrito they have." if sleep >= 15 && !breakfast 
