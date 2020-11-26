class CardsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  def new
  end

  def create
    Payjp.api_key = Rails.application.credentials.PAYJP[:PAYJP_SECRET_KEY]
    customer = Payjp::Customer.create(
    description: 'test', # テストカードであることを説明
    card: params[:card_token] # 登録しようとしているカード情報
    )
    card = Card.new( # トークン化されたカード情報を保存する
      card_token: params[:card_token], # カードトークン
      customer_token: customer.id, # 顧客トークン
      user_id: current_user.id # ログインしているユーザー
    )
    if card.save
      redirect_to user_path(current_user)
    else
      redirect_to "new" # カード登録画面
    end
  end
end
#Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
#Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]