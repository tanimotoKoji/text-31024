class TopPagesController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
  end

  def show
    @posts = Post.includes(:user)
    @evaluations = Evaluation.includes(:post)
    @post_rank = Post.find(PostOrder.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    @users = User.includes(:relationships)
    @user_rank = User.find(Relationship.group(:follow_id).order('count(follow_id) desc').limit(3).pluck(:follow_id))
    @buy = PostOrder.where(user_id: current_user.id).pluck(:post_id)
  end
  
end
