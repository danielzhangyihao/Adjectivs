class Asset < ActiveRecord::Base
	belongs_to :product


	has_attached_file :asset, :styles =>{:large => "640x480>", :medium =>"354x354#", :thumb =>"100x100>"} 


	validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/




       
end
