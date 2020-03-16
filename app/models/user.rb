class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews
    validates_presence_of :username, :password 
    validates_uniqueness_of :username
    has_secure_password 
end 