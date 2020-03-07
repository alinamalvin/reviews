class Product < ActiveRecord::Base
    has_many :reviews
    belongs_to :category
    validates_presence_of :brand, :title, :category 

end