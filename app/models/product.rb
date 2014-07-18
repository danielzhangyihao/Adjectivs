class Product < ActiveRecord::Base
	has_many :assets,  dependent: :destroy, autosave: true                                                                                                                                      
    accepts_nested_attributes_for :assets, :allow_destroy =>true,reject_if: :all_blank

	validates :name,  presence: true
	validates :price,  presence: true, :numericality => true
	validates :description,  presence: true
	



end
