require 'jptax/version'

module Jptax
  def amount_with_tax(amount=0, amount_for_reduced=0, round_types='floor')
    if round_types == 'ceil'
      (amount.to_i * 1.1 + amount_for_reduced.to_i * 1.08).ceil
    elsif round_types == 'round'
      (amount.to_i * 1.1 + amount_for_reduced.to_i * 1.08).round
    else
      (amount.to_i * 1.1 + amount_for_reduced.to_i * 1.08).floor
    end
  end

  module_function :amount_with_tax
end
