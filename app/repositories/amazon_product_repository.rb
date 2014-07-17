#require 'amazon_product_advertising_api'
#class AmazonProductRepository
	#def fetch (product_id)
		#amazon_product_advertising_api = AmazonProductAdvertisingApi::Base.new
		#amazon_product_advertising_api.access_key_id='AKIAIWKGAOCVWSXLPDDA'
		#AmazonProductAdvertisingApi::Base.secret_access_key = '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'
		#AmazonProductAdvertisingApi::Base.associate_ids.us=''

        #item_lookup=AmazonProductAdvertisingApi::Operations::Item::ItemLookup.new(product_id)
		
		#if item_lookup.run == false
		#	puts 'hello'
	    #else
		#item_lookup.response.items.first.item_attributes.title
	  #end
	#end 
#end