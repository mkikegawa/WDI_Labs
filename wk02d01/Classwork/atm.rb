class User
  def initialize(name, pin, accounts)
    @name     = name
    @pin      = pin
    @accounts = accounts
  end
  ...
end


# Flavor 1
user =  User.new("Mike", 1234, [
  Account.new("Checking", 200.00),
  Account.new("Savings", 500.00)
  ])


# FLavor 2
mikes_accounts = []
mikes_accounts << Account.new("Checking", 200.00)
mikes_accounts << Account.new("Savings", 500.00)
user = User.new("Mike", 1234, mikes_accounts)

# Flavor 3
checking_account = Account.new("Checking", 200.00)
savings_account  = Account.new("Savings", 500.00)
mikes_accounts   = [checking_account, savings_account]
user             = User.new("Mike", 1234, mikes_accounts)

# Flavor 4
user = User.new("Mike", 1234)
user.add_account(Account.new("Checking", 200.00))
user.add_account(Account.new("Savings", 500.00))

# Flavor 5

class User
  def initialize(args)
    @name     = args[:name]
    @pin      = args[:pin]
    @accounts = args[:accounts]
  end
end

mikes_accounts = []
mikes_accounts << Account.new("Checking", 200.00)
mikes_accounts << Account.new("Savings", 500.00)

user = User,new( name: "Mike", pin: 1234, accounts: mikes_accounts)