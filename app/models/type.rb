class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ビジネス' },
    { id: 3, name: 'エンタメ'},
    { id: 4, name: '美容'},
    { id: 5, name: '人間関係'},
    { id: 6, name: 'テクノロジー'},
    { id: 7, name: 'その他'}
  ]
  include ActiveHash::Associations
  has_many :posts

end
