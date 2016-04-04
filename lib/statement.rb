class Statement

  def print_statement(account)
    answer = ["date || credit || debit || balance"]
    account.history.reverse_each do |transaction|
      formatter(transaction)
      answer.push("#{transaction[:date]} || #{@result_credit} || #{@result_debit} || #{transaction[:balance]}"
    end
    return answer
  end

  def formatter(hash)
    @result_credit = hash[:sum] if hash[:sum] > 0
    @result_debit = hash[:sum] if hash[:sum] < 0
  end






end
