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
    viglink_data=obj.objects['nordstrom_s3.xml']
     
    
    file_name="#{Process.pid}_files.xml"
    # file = File.open("#{Rails.root}/tmp/#{file_name}","wb")
    # streaming download from S3 to a file on disk
    
    #begin
    #file.write(viglink_data.read) do |chunk|
     # file.write(chunk)
     #end
    #end
    #file.close


    File.open("#{Rails.root}/tmp/#{file_name}", 'wb') do |file|
     viglink_data.read do |chunk|
      file.write(chunk)
      end
    end
    
    f = File.open("#{Rails.root}/tmp/#{file_name}")
    puts f.size
    doc = Nokogiri::XML(f)
    
    
     
     puts "1"
     if doc.xpath("/merchandiser/product")
      puts "yes"
     else 
      puts "no"
    end 
      variant = doc.xpath("/merchandiser/product").each do |product|
        puts "inside loop"
        product_name = product.attribute('name').text()
        puts product_name
        product_price = product.at('price/retail').text()
        puts product_price
        product_description = product.at('description/short').text()
        puts product_description
        image_url = product.at('URL/productImage').text()
        full_url= product.at('URL/product').text()
        encoded_url=full_url.split('murl=')[1]
        decoded_url=URI.decode(encoded_url)
        puts decoded_url

        puts "finish parsing"

      


      
      viglink_product = Product.create!(name: product_name, price: product_price, description: product_description, buy_url: decoded_url)
      viglink_assets = viglink_product.assets.build
      viglink_assets.asset = URI.parse(image_url)
      viglink_assets.save!
      viglink_product.save!

      end
      puts "outside loop"
    

  end
end
