class Asset < ActiveRecord::Base
	belongs_to :product
	has_attached_file :asset, :styles =>{:large => "640x480>", :medium =>"300x300>", :thumb =>"100x100>"}, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
	validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/



	def s3_credentials
    {:bucket => "adjectivs-products", :access_key_id => "AKIAIWKGAOCVWSXLPDDA", :secret_access_key => "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"}
    end

     
       
end
