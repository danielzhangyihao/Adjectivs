class StaticPagesController < ApplicationController
   before_action :signed_in_user, only: :feed

  def home
  end

  def help
  end

  def about
  end

  def contact
  end
 
  def feed
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

end
