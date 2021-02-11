class Comment < ApplicationRecord
  validates :content, :presence => true, :length => {:in => 1..500}
  
  belongs_to :user
  belongs_to :article
end
