class Article < ApplicationRecord
  validates :title, :presence => true, :uniqueness => true, :length => {:in => 1..120}
  validates :content, :presence => true 
  
  belongs_to :user
  has_many :comments, :dependent => :delete_all
end
