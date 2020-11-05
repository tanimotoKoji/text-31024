class OrdersController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
  end

  def create
  end

end
