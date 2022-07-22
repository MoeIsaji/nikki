class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update]

 def show
    @customer = Customer.find(params[:id])
    @customer = Customer.new
    @customers = @customer.articles
 end

 def index
    @customers = Customer.all
    @article = Article.new
 end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: "You have updated customer successfully."
    else
      render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:user_name, :introduction, :profile_image)
  end


  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to customer_path(current_customer)
    end
  end
end
