class Api::UsersController < ActionController::API
  before_action :set_user, only: [:transactions, :create_transaction]

  def transactions
    render json: @user.transactions, status: :ok, each_serializer: CustomTransactionSerializer
  end

  def create_transaction
    transaction = @user.transactions.new(transaction_params)
    if transaction.save
      render json: transaction.reload, status: :ok, serializer: CustomTransactionSerializer
    else
      render json: {errors: transaction.errors}, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    {
      account_id: params[:account_id],
      amount: params[:amount],
      transaction_type: params[:transaction_type]
    }
  end

  def set_user
    @user = User.find(params[:id])
  end
end
