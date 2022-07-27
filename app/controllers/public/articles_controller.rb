class Public::ArticlesController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all.order(created_at: :desc)
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.customer_id = current_customer.id
    if @article.save
      redirect_to article_path(@article), notice: "You have created ariticle successfully."
    else
      @articles = Article.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "You have updated article successfully."
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :customer_id, :open_close)
  end

  def ensure_correct_customer
    @article = Article.find(params[:id])
    unless @article.customer == current_customer
      redirect_to articles_path
    end
  end
end