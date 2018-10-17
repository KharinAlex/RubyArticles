class User < ApplicationRecord
	validates :name, :presence => true, :uniqueness => true, :length => {:in => 3..20}
  	validates :email, :presence => true, :uniqueness => true
  	validates :password, :presence => true 
	has_many :comments,	:dependent => :delete_all
	has_many :articles,	:dependent => :delete_all
end
