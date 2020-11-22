class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '記事・書物' },
    { id: 3, name: 'ビジネスプラン'},
    { id: 4, name: '自己PR'},
    { id: 5, name: 'グループ内アンケート'},
    { id: 6, name: '一般アンケート'},
    { id: 7, name: 'その他'}
  ]
  include ActiveHash::Associations
  has_many :posts
end
