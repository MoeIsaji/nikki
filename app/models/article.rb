class Article < ApplicationRecord
   belongs_to :customer
   has_many :likes, dependent: :destroy
   has_many :article_tags, dependent: :destroy
   has_many :comments, dependent: :destroy
   
   validates :title,presence:true
   validates :body,presence:true,length:{maximum:200}
  
  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end
	
  def self.search_articles_for(content, method)
    if method == 'perfect'
      Article.where(title: content)
    elsif method == 'forward'
      Article.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Article.where('title LIKE ?', '%'+content)
    else
      Article.where('title LIKE ?', '%'+content+'%')
    end
  end
  
end
