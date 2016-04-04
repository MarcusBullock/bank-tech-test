require './lib/statement'

describe Statement do

  subject(:statement) {described_class.new}
  let(:account){ double('account') }

  before do
    history = [{date: '20/12/2016', sum: 100, balance: 100}, {date: '23/12/2016', sum: 20, balance: 80}]
    allow(:account).to receive(:history).and_return(history)
  end

  it '-> should print the bank statement in the correct format' do
    expect(statement.print_statement(account)).to eq("date || credit || debit || balance\n23/12/2016 || 100.00 || || 100.00\n21/12/2016 || || 20.00 || 80.00")
  end

end
