class Occupation < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '営業職種'},
    { id: 3, name: '企画・管理系職種'},
    { id: 4, name: '事務系職種（オフィスワーク）'},
    { id: 5, name: '技術系職種（通信/IT/SE・システムエンジニア)'},
    { id: 6, name: '技術系職種（機械/電気/組み込み)'},
    { id: 7, name: '技術系職種 (建設設計/土木/プラント/設備)'},
    { id: 8, name: '技術系職種 (素材/化学/食品/その他)'},
    { id: 9, name: '医療専門職種 (医療・メディカル/介護/福祉)'},
    { id: 10, name: '金融専門職 (銀行/保険/FP・ファイナンシャルプランナー)'},
    { id: 11, name: '販売・サービス系職種'},
    { id: 12, name: 'クリエイティブ・クリエイター職種'},
    { id: 13, name: '専門職種（コンサルタント・マーケティング・不動産・土業系)'},
    { id: 14, name: '公務系職種（公務員・官公庁・教員・農林水産関連)'},
  ]
  include ActiveHash::Associations
  has_many :users
end