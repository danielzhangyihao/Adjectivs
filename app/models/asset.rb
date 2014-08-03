class Asset < ActiveRecord::Base
	belongs_to :product


	has_attached_file :asset, :styles =>{:display=>"250x250#", :large => "640x480>", :medium =>"354x354#", :thumb =>"100x100>", :grid =>"218x327#"} 


	validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/




       
end
