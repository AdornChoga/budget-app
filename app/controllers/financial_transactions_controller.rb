class FinancialTransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :create_transaction, only: [:create]
  before_action :find_category

  def index
    @financial_transactions = @category.financial_transactions
  end

  def new
    @financial_transaction = FinancialTransaction.new
  end

  def create
    @financial_transaction.user = current_user
    @financial_transaction.categories << @category
    if @financial_transaction.save
      flash[:notice] = 'Transaction was created successfully'
      redirect_to category_financial_transactions_path(params[:category_id])
    else
      flash[:alert] = @financial_transaction.errors.first.full_message.to_s if @financial_transaction.errors.any?
      redirect_to new_category_financial_transaction_path
    end
  end

  protected

  def create_transaction
    @financial_transaction = FinancialTransaction.create(transaction_params)
  end

  def find_category
    @category = Category.find(params[:category_id])
  end

  def transaction_params
    params.require(:financial_transaction).permit(:name, :amount)
  end
end
