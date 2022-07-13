class User < ApplicationRecord

   has_many :relationships, dependent: :destroy
   has_many :articls, dependent: :destroy
   has_many :likes, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_one_attached :image
end
