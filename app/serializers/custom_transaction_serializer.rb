class CustomTransactionSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper
  attributes :id, :account_id, :amount, :bank, :transaction_type, :created_at

  def account_id
    object.account.id
  end

  def bank
    object.account.bank
  end

  def amount
    number_with_precision(object.amount, precision: 2)
  end

  def created_at
    object.created_at.to_s
  end
end
