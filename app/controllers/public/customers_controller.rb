class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update]

 def show
    @customer = Customer.find(params[:id])
    @article = Article.new
    @articles = @customer.articles
 end

 def likes
    likes = Like.where(customer_id: current_customer.id).pluck(:article_id)
    @like_list = Article.find(likes)
 end

 def index
    @customers = Customer.all
    @article = Article.new
 end


 def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to root_path
 end

  def edit
     @customer = current_customer
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
