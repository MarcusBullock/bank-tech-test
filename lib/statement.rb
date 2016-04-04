class Statement

  def print_statement(account)
    answer = ["date || credit || debit || balance"]
    account.history.reverse_each do |transaction|
      formatter(transaction)
      answer.push("#{transaction[:date]} || #{'%.02f' % @result_credit if @result_credit} || #{'%.02f' % @result_debit if @result_debit} || #{'%.02f' % transaction[:balance]}")
    end
    answer.each_slice(1) { |element| puts element.join}
  end

  def formatter(hash)
    @result_credit = hash[:sum] if hash[:sum] > 0
    @result_debit = hash[:sum] if hash[:sum] < 0
  end


end
