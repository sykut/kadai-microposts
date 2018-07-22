class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
  end
  
  def show
    @user = current_user
    @micropost = current_user.favorites
    @microposts = current_user.likes.order('created_at DESC').page(params[:page])
  end
    
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'micropostをお気に入りしました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'micropostのお気に入りを解除しました。'
    redirect_back(fallback_location: root_url)
  end
  
  
end
