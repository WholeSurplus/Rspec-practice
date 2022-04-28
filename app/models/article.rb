class Article < ApplicationRecord
  validates :title, presence:true, length: { minimum: 5 }
  validates :content, presence:true, length: { minimum: 10 }

  extend FriendlyId
  friendly_id :title, use: :slugged

end
