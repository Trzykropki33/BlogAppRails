class HomeController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def profile
    
  end
end
