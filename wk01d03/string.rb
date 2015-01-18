test_string = "Happy Days"
test_string2 = "The Fonz"

## Public Class Methods

# new(str="") -> new_str
puts String.new(test_string)          # returns "Happy Days"

# try_convert(obj) -> string or nil
puts String.try_convert("pickle3")    # returns "pickle3"

## Public Instance Methods

# str % arg --> new_str     -- uses Kernel::sprintf formatting
puts "      %s"  % test_string         # returns "      Happy Days"

# str * integer  --> new_str
puts test_string * 3                   # returns "Happy DaysHappy DaysHappy Days"

# str + other_str --> new_str
puts "Hello to you from, " + test_string # returns "Hello to you from, Happy Days "

# str << integer --> str
puts test_string << ", are here again."    # return "Happy Days, are here again."

# string <=> other_string   ---> -1, 0, +_1 or nil
puts test_string <=> test_string2          #returns -1 to show that test_string2 evaulates higher than test_string

