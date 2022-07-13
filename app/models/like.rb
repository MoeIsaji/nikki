class Like < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
end