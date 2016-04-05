class Account

  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(cash)
    @balance += cash
    @history.push({date: Time.now.strftime("%d/%m/%Y"), sum: cash, balance: balance})
  end

  def withdraw(cash)
    @balance -= cash unless (@balance - cash <= 0)
    @history.push({date: Time.now.strftime("%d/%m/%Y"), sum: -cash, balance: balance})
  end

end
