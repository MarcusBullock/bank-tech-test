class Statement

  def print_statement(account)
    answer = ["date || credit || debit || balance"]
    account.history.reverse_each do |transaction|
      set_credit_and_debit(transaction)
      answer.push("#{transaction[:date]} || #{money_format(@result_credit)} || #{money_format(@result_debit)} || #{money_format(transaction[:balance])}")
    end
    answer.each_slice(1) { |element| puts element.join}
  end

  def set_credit_and_debit(hash)
    @result_credit = hash[:sum] if hash[:sum] > 0
    @result_debit = hash[:sum] if hash[:sum] < 0
  end

  def money_format(sum)
    '%.02f' % sum if sum
  end

end
