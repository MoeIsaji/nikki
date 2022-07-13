class Article < ApplicationRecord
   belongs_to :user
   has_many :likes, dependent: :destroy
   has_many :article_tags, dependent: :destroy
   has_many :comments, dependent: :destroy
end
