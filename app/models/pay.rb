class Pay < ActiveHash::Base
  self.data = [
    { id: 1, name: '有料公開'},
    { id: 2, name: '無料公開'}
  ]
  include ActiveHash::Associations
  has_many :posts
end
