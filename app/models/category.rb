class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '飲食用品'},
    { id: 3, name: '生活用品'},
    { id: 4, name: 'ビジネス用品'},
    { id: 5, name: '家電、デバイス'},
    { id: 6, name: '美容'},
    { id: 7, name: '自動車'},
    { id: 8, name: '教育'},
    { id: 9, name: 'サービス'},
    { id: 10, name: '書籍、記事'},
    { id: 11, name: 'その他'}
  ]
  include ActiveHash::Associations
  has_many :posts
end
