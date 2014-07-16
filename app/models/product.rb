class Product < ActiveRecord::Base
	has_many :assets
	accepts_nested_attributes_for :assets, :allow_destroy =>true
	validates :name,  presence: true
	validates :price,  presence: true, :numericality => true
	validates :description,  presence: true
	



end
