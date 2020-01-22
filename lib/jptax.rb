require 'jptax/version'

module Jptax
  def amount_with_tax(amount=0, amount_for_reduced=0)
    (amount * 1.1 + amount_for_reduced * 1.08).floor
  end

  module_function :amount_with_tax
end
