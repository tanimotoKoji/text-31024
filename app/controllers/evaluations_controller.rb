class EvaluationsController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create,:show]
  helper_method :sort_column, :sort_direction
  
  def index
    @post = Post.find(params[:post_id])
    @evaluation = Evaluation.new
  end

  

  def create
    @post = Post.find(params[:post_id])
    @evaluation = Evaluation.create(evaluation_params)
    if @evaluation.save
        redirect_to root_path
      else
        render :index
      end
    end
  
  def show
    @post = Post.find(params[:id])
    @evaluation = Evaluation.new
    @evaluations = @post.evaluations
    @first_id = Evaluation.where(post_id: @post.id).pluck(:first_id)
    @aggregate = aggregateOpinion(@first_id)
    @second_id = Evaluation.where(post_id: @post.id).pluck(:second_id)
    @second_aggregate = aggregateOpinion(@second_id)
    @third_id = Evaluation.where(post_id: @post.id).pluck(:third_id)
    @third_aggregate = aggregateOpinion(@third_id)
    @fourth_id = Evaluation.where(post_id: @post.id).pluck(:fourth_id)
    @fourth_aggregate = aggregateOpinion(@fourth_id)
    @fifth_id = Evaluation.where(post_id: @post.id).pluck(:fifth_id)
    @fifth_aggregate = aggregateOpinion(@fifth_id)
  end

  def aggregateOpinion(array)
    result = [["素晴らしい",0],["良い",0],["どちらでもない",0],["あまり良くない",0],["改善した方が良い",0]]
    array.each do |i|
      if i == 1
        result[0][1] += 1
      elsif i == 2
        result[1][1] += 1
      elsif i == 3
        result[2][1] += 1
      elsif i == 4
        result[3][1] += 1
      else 
        result[4][1] += 1
      end
    end
    return result
  end

  private
    def evaluation_params
      params.require(:evaluation).permit(:comment, :first_id, :second_id, :third_id, :fourth_id, :fifth_id, :rate).merge(user_id: current_user.id, post_id: params[:post_id])
    end
end

#.require(:evaluation)