class PostComment < ApplicationRecord
  validates :body, presence: true, length: {minimum: 5}

  belongs_to :post
end
