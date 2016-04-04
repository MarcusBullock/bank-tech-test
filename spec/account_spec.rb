require './lib/account'

describe Account do

  subject(:account) {described_class.new}

  it '-> should initialize with an empty balance & history' do
    expect(account.balance).to eq(0)
    expect(account.history).to be_empty
  end

  it '-> should allow money to be deposited' do
    account.deposit(100, '10/10/2016')
    expect(account.history).to include('10/10/2016 || 100.00')
  end

  it '-> should allow money to be withdrawn' do
    account.deposit(100, '09/09/2016')
    account.withdraw(10, '10/10/2016')
    expect(account.history).to include('10/10/2016 || 10.00')
  end

  it '-> should print the statement in the correct format' do
    account.deposit(100, '09/09/2016')
    account.withdraw(10, '10/10/2016')
    expect(account.history).to include([10/10/2016 || || 10.00 || 90.00]
    expect(account.history).to include([09/09/2016 || 100.00 || || 100.00])
  end

end
