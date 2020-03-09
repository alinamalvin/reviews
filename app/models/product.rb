class Product < ActiveRecord::Base
    has_many :reviews
    validates_presence_of :brand, :title, :category 
    scope :cleanser, -> {where(category: 'Cleanser')}
    scope :makeup, -> {where(category: 'Makeup')}
end