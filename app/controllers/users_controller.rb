class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @profile = @user.profile
    @age = @user.age.name
    @occupation = @user.occupation.name
    @gender = @user.gender.name
    @post = @user.posts
    @posts = @post.where.not(genre_id: 5)
    @buy = PostOrder.where(user_id: current_user.id).pluck(:post_id)
    @user_image = @user.image

    #Payjp.api_key = Rails.application.credentials.PAYJP[:PAYJP_SECRET_KEY]
    #card = Card.find_by(user_id: current_user.id) 

    #redirect_to new_card_path and return unless card.present?

    #customer = Payjp::Customer.retrieve(card.customer_token)
    #@card = customer.cards.first
  end
  

end
