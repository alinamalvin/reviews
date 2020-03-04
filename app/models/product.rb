class Product < ActiveRecord::Base
    has_many :reviews
    validates_presence_of :brand, :title, :category 

end