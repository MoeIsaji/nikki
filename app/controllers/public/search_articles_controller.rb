class Public::SearchArticlesController < ApplicationController
  before_action :authenticate_customer!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'customers'
			@records = Customer.search_articles_for(@content, @method)
		else
			@records = Article.search_articles_for(@content, @method)
		end
	end
end