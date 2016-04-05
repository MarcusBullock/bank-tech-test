require './lib/statement'

describe Statement do

  subject(:statement) { described_class.new }
  let(:account) {double(:account)}

  before do
    x = [
      {date:'21/12/2016', sum: 100, balance:100},
      {date:'23/01/2012', sum: -20, balance: 80}
    ]
    allow(account).to receive(:history).and_return(x)
  end

  it '-> should print the bank statement in the correct format & order' do
    expect{statement.print_statement(account)}.to output(
      "\"date || credit || debit || balance\"\n\"23/12/2016 || || -20.00 || 100.00\"\n\"21/12/2016 || 100.00 || || 80.00\"\n"
    ).to_stdout
  end

  it '-> can filter statements by deposit' do
    expect{statement.filter('deposit')}.to output("21/12/2016 || 100.00 || || 80.00\"\n").to_stdout
  end


end
