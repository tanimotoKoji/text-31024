class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @profile = user.profile
    @age = user.age.name
    @occupation = user.occupation.name
    @gender = user.gender.name
    @posts = user.posts
    @user_image = user.image
  end
  
end
