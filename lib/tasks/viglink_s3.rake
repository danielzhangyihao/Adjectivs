require 'aws-sdk'
require 'nokogiri'
require 'uri'
require 'open-uri'


namespace :db do
  desc "get data from viglink s3 bucket parse and store product object in database"
  #task :productData [:store] => :environment do |task, args|
  task productData: :environment  do
    s3 = AWS::S3.new
    obj = s3.buckets['viglink-data']
    viglink_data=obj.objects['nordstrom-test.xml']
     
    
    #file_name="#{Process.pid}_files.xml"
    #file = File.open("#{Rails.root}/tmp/#{file_name}","wb")
    # streaming download from S3 to a file on disk
    
    #begin
    #file.write(viglink_data.read) do |chunk|
     # file.write(chunk)
     #end
    #end
    #puts file.size
    #file.close
    #puts file.size


    #File.open("#{Rails.root}/tmp/#{file_name}", 'wb') do |file|
     #viglink_data.read do |chunk|
      #file.write(chunk)
      #end
    #end
    
    #f = File.open("#{Rails.root}/tmp/#{file_name}")
    #puts f.size
    #doc = Nokogiri::XML(f)
    #doc = Nokogiri::XML(file)
    doc = Nokogiri::XML(viglink_data.read)
    doc.xpath("/merchandiser/product")
      
      variant = doc.xpath("/merchandiser/product").each do |product|
        if product.at('category/primary').text()=="Women"
          product_name = product.attribute('name').text()
          product_price = product.at('price/retail').text()
          product_description = product.at('description/short').text()
          image_url = product.at('URL/productImage').text()
          full_url= product.at('URL/product').text()
          encoded_url=full_url.split('murl=')[1]
          decoded_url=URI.decode(encoded_url)
          primary=product.at('category/primary').text()
          secondary=product.at('category/secondary').text()
          brand=product.at('brand').text()
          size=product.at('attributeClass/Size').text()
          color=product.at('attributeClass/Color').text()


      
          viglink_product = Product.create!(name: product_name, price: product_price, description: product_description, buy_url: decoded_url,primary:primary,secondary:secondary,brand:brand,size:size,color:color)
          viglink_assets = viglink_product.assets.build
          viglink_assets.asset = URI.parse(image_url)
          viglink_assets.save!
          viglink_product.save!
      end

      end
    

  end
end
