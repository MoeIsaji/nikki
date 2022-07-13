class Comment < ApplicationRecord
 has_many :likes, dependent: :destroy
 has_many :articles, dependent: :destroy
end
