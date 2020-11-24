class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '記事・作品投稿'},
    { id: 3, name: 'アンケート・データ集計'},
    { id: 4, name: 'その他'}
  ]
  include ActiveHash::Associations
  has_many :posts
end
