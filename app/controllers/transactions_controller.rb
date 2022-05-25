class TransactionsController < ApplicationController
  before_action :create_transaction, only: [:create]
  def index; end

  def new
    @financial_transaction = FinancialTransaction.new
  end

  def create
    @financial_transaction.user = current_user
    if @financial_transaction.save
      flash[:notice] = 'Transaction created successfully'
      redirect_to category_transactions_path(params[:category_id])
    else
      flash[:alert] = @financial_transaction.errors.first.full_message.to_s if @financial_transaction.errors.any?
      redirect_to new_category_transaction_path
    end
  end

  protected

  def create_transaction
    @financial_transaction = FinancialTransaction.create(transaction_params)
  end

  def transaction_params
    params.require(:final_transaction).permit(:name, :amount)
  end
end
