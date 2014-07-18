class AssetsController < ApplicationController
	def destroy 
          Asset.find(params[:id]).destroy
          flash[:success] = "Asset deleted."
          redirect_to products_url
    end
end