class Account

  attr_reader :name, :balance
  def initialize(args)
    @name    = args[:name]
    @balance = args[:balance]
  end

  def deposit(amount)
    @balance += amount
    self
  end

  def withdraw(amount)
    @balance -= amount
    self
  end

  def to_s
    "#{@name} account has a balance of $#{@balance}"
  end
end