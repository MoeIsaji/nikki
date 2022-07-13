class ArticleTag < ApplicationRecord
  belongs_to :article
  has_many :tags, dependent: :destroy
end
