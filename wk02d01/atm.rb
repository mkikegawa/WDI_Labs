require "./Account.rb"

class User
  attr_reader :name
  def initialize(args)
    @name     = args[:name]
    @pin      = args[:pin]
    @accounts = args[:accounts] || [] 
  end

  def pin_validate?(pin)
    @pin == pin
  end
 
  def add_account(args)
    @accounts << Account.new(args)
  end


  ## bug correct the string formatting for each account.
  def to_s  
    "#{@name} has #{@accounts}"
  end
end

class Atm
  def initialize
    @user      = nil
  end

  def pin_prompt
    puts "Please enter your pin: "
    get_user_pin
  end

  def get_user_pin
    @pin = gets.chomp
  end

  def pin_valid?
    @user.pin_validate?(@pin)
  end

  def login
    pin_prompt until pin_valid?
  end

  def transaction_messages
    [ "Please enter your choice:", 
      "[w] - Withdraw",
      "[d] - Deposit",
      "[t] - Transfer",
      "[q] - Quit"
    ]
  end


  def transactions
    transaction_messages.each {|message| puts message}

  end

  def process    
    login
    transactions
  end


end



mikes_accounts = []
mikes_accounts << Account.new(name: "Checking", balance: 200.00)
mikes_accounts << Account.new(name: "Savings",  balance: 500.00)
user = User.new( name: "Mike", pin: 1234, accounts: mikes_accounts )

atm = Atm.new
atm.process
