class SecretController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  def index
    @user = User.find(params[:user_id])
    @nickname = @user.nickname
    @post = @user.posts
    @user_image = @user.image
    
    sales_set
    sales_set_total
    
   
    @question = Post.where(id: @post.ids).where(genre_id: 5)
    @relations = Relationship.includes(:user)
    @relation = Relationship.where(follow_id: @user.id)
    @answers = Post.where(genre_id: 5)
    @buy = PostOrder.where(user_id: current_user.id).pluck(:post_id)
    @posts = Post.where(id: @buy)
 end

 def show
    @user = User.find(params[:user_id])
    @gender_id = User.pluck(:gender_id)
    @gender_count = aggregateOpiniong(@gender_id)
    @age_id = User.pluck(:age_id)
    @age_count = aggregateOpiniona(@age_id)
    @occupation_id = User.pluck(:occupation_id)
    @occupation_count = aggregateOpiniono(@occupation_id)
    @category_id = Post.pluck(:category_id)
    @category_count = aggregateOpinionc(@category_id)
    @genre_id = Post.pluck(:genre_id)
    @genre_count = aggregateOpiniongg(@genre_id)
    @type_id = Post.pluck(:type_id)
    @type_count = aggregateOpiniont(@type_id)
    @post_all = Post.all 
    @totalsales = PostOrder.all.includes(:post)

 end

 private

 def sales_set
   @posts = @post.where.not(price: 0)
   @order_posts = PostOrder.where(post_id: @posts.ids)
   @today = Date.today
   @lastmonth_today = @today.prev_day(7)
 end  
  
 def sales_set_first
   @order_post_f = PostOrder.where(post_id: @posts.ids).first
   @price_f = @order_post_f.post.price
   @count_f = PostOrder.where(post_id: @order_post_f.post.id).count
   @amount_f = @price_f * @count_f
 end 
 
 def sales_set_second
   @order_post_s = PostOrder.where(post_id: @posts.ids).where.not(post_id: @order_post_f.post_id).first
   @price_s = @order_post_s.post.price
   @count_s = PostOrder.where(post_id: @order_post_s.post.id).count
   @amount_s = @price_s * @count_s
 end

 def sales_set_third
   @order_post_t = PostOrder.where(post_id: @post.ids).where.not(post_id: @order_post_f.post_id).where.not(post_id: @order_post_s.post_id).first
   @price_t = @order_post_t.post.price
   @count_t = PostOrder.where(post_id: @order_post_t.post.id).count
   @amount_t = @price_t * @count_t
 end

 def sales_set_total
  if @order_posts.select(:post_id).distinct.count == 1
    sales_set_first
    @sales_first = [[@order_post_f.post.title, @amount_f]]  
  elsif @order_posts.select(:post_id).distinct.count == 2
    sales_set_first
    sales_set_second
    @sales_second = [[@order_post_f.post.title, @amount_f], [@order_post_s.post.title, @amount_s]]  
  elsif @order_posts.select(:post_id).distinct.count >= 3
    sales_set_first
    sales_set_second
    sales_set_third
    @sales_third = [[@order_post_f.post.title, @amount_f], [@order_post_s.post.title, @amount_s], [@order_post_t.post.title, @amount_t]]
  end  
end



  def aggregateOpiniong(array)
    result = [["男性",0],["女性",0],["その他",0]]
     array.each do |i|
        if i == 1
          result[0][1] += 1
        elsif i == 2
          result[1][1] += 1
        elsif i == 3
          result[2][1] += 1
        end
      end
      return result
    end

    def aggregateOpiniona(array)
      result = [["10~19歳",0],["20~29歳",0],["30~39歳",0],["40~49歳",0],["50~59歳",0],["60歳~",0]]
       array.each do |i|
          if i == 2
            result[0][1] += 1
          elsif i == 3
            result[1][1] += 1
          elsif i == 4
            result[2][1] += 1
          elsif i == 5
            result[3][1] += 1
          elsif i == 6
            result[4][1] += 1
          elsif i == 7
            result[5][1] += 1
          end
        end
        return result
      end

      def aggregateOpiniono(array)
        result = [["営業",0],["企画・管理",0],["事務",0],["IT",0],["機械・電気",0],["建設",0],["化学・食品",0],["医療",0],["金融",0],["販売・サービス",0],["広告・クリエイター",0],["コンサル",0],["公務系",0]]
         array.each do |i|
            if i == 2
              result[0][1] += 1
            elsif i == 3
              result[1][1] += 1
            elsif i == 4
              result[2][1] += 1
            elsif i == 5
              result[3][1] += 1
            elsif i == 6
              result[4][1] += 1
            elsif i == 7
              result[5][1] += 1
            elsif i == 8
              result[6][1] += 1
            elsif i == 9
              result[7][1] += 1
            elsif i == 10
              result[8][1] += 1
            elsif i == 11
              result[9][1] += 1
            elsif i == 12
              result[10][1] += 1
            elsif i == 13
              result[10][1] += 1
            elsif i == 14
              result[11][1] += 1  
            end
          end
          return result
        end
        
        def aggregateOpinionc(array)
          result = [["記事・作品投稿",0],["アンケート・データ集計",0],["その他",0]]
           array.each do |i|
              if i == 2
                result[0][1] += 1
              elsif i == 3
                result[1][1] += 1
              elsif i == 4
                result[2][1] += 1
              end
            end
            return result
          end

          def aggregateOpiniongg(array)
            result = [["記事・書物",0],["ビジネスプラン",0],["自己PR",0],["グループ内アンケート",0],["一般アンケート",0],["その他",0]]
             array.each do |i|
                if i == 2
                  result[0][1] += 1
                elsif i == 3
                  result[1][1] += 1
                elsif i == 4
                  result[2][1] += 1
                elsif i == 5
                  result[3][1] += 1
                elsif i == 6
                  result[4][1] += 1
                elsif i == 7
                  result[5][1] += 1
                end
              end
              return result
            end

            def aggregateOpiniont(array)
              result = [["ビジネス",0],["エンタメ",0],["美容",0],["人間関係",0],["テクノロジー",0],["その他",0]]
               array.each do |i|
                  if i == 2
                    result[0][1] += 1
                  elsif i == 3
                    result[1][1] += 1
                  elsif i == 4
                    result[2][1] += 1
                  elsif i == 5
                    result[3][1] += 1
                  elsif i == 6
                    result[4][1] += 1
                  elsif i == 7
                    result[5][1] += 1
                  end
                end
                return result
              end
    
 end