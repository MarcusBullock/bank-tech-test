class Account

  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(cash, date)
    @balance += cash
    @history << "#{date} || #{'%.2f' % cash.to_f}"
  end

  def withdraw(cash, date)
    @balance -= cash
    @history << "#{date} || #{'%.2f' % cash.to_f}"
  end

end
