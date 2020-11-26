class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update]
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :find_post, only: :order

  # GET /posts
  # GET /posts.json
  def index
    @post = Post.where.not(genre_id: 5).includes(:user)
    @q = Post.where.not(genre_id: 5).ransack(params[:q])
    @post = @q.result(distinct: true)
    @buy = PostOrder.where(user_id: current_user.id).pluck(:post_id)
  end
  # GET /posts/new
  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
    @follower = Relationship.where(follow_id: @user.id).pluck(:user_id)
    @buy = PostOrder.where(user_id: current_user.id).pluck(:post_id)
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def order 
    redirect_to new_card_path and return unless current_user.card.present?

    Payjp.api_key = Rails.application.credentials.PAYJP[:PAYJP_SECRET_KEY]
   customer_token = current_user.card.customer_token 
   Payjp::Charge.create(
     amount: @post.price, 
     customer: customer_token, 
     currency: 'jpy' 
     )

     PostOrder.create(post_id: params[:id], user_id: current_user.id, price: @post.price)
     redirect_to post_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :pay_id, :price, :category_id, :genre_id, :type_id, :number1, :number2, :number3, :number4, :number5).merge(user_id:current_user.id)
    end

    def find_post
      @post = Post.find(params[:id]) 
    end

    
end
