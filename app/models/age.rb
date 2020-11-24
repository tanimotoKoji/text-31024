class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '10歳〜19歳'},
    { id: 3, name: '20歳〜29歳'},
    { id: 4, name: '30歳〜39歳'},
    { id: 5, name: '40歳〜49歳'},
    { id: 6, name: '50歳〜59歳'},
    { id: 7, name: '60歳〜'}
  ]
  include ActiveHash::Associations
  has_many :users
end