class Account

  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(cash, date)
    @balance += cash
    @history.push(date: date, sum: cash, balance: balance)
  end

  def withdraw(cash, date)
    @balance -= cash unless (@balance - cash <= 0)
    @history.push(date: date, sum: -cash, balance: balance)
  end

end
