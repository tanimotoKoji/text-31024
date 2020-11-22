# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category1 = Type.create(name:"記事・作品投稿")
category2 = Type.create(name:"アンケート・データ集計")

category1_1 = category1.children.create(name:"記事・書物")
category1_2 = category1.children.create(name:"ビジネスプラン")
category1_3 = category1.children.create(name:"自己PR")

category1_1.children.create([{name:"物語"},{name:"ノウハウ"},{name:"分析・風刺"},{name:"情報公開"},{name:"その他"}])
category1_2.children.create([{name:"商品"},{name:"サービス"},{name:"システム"},{name:"その他"}])
category1_3.children.create([{name:"営業職"},{name:"企画・管理職"},{name:"事務職"},{name:"技術職（IT）"},{name:"技術職（機械・電気)"},{name:"技術職（建設設計)"},{name:"技術系職種(素材・化学)"},{name:"医療介護"},{name:"金融"},{name:"販売・サービス"},{name:"その他"}])

category2_1 = category2.children.create(name:"グループ内アンケート")
category2_2 = category2.children.create(name:"一般アンケート")
category2_3 = category2.children.create(name:"その他")

category2_1.children.create([{name:"ビジネス"},{name:"エンタメ"},{name:"美容"},{name:"人間関係"},{name:"テクノロジー"}])
category2_2.children.create([{name:"ビジネス"},{name:"エンタメ"},{name:"美容"},{name:"人間関係"},{name:"テクノロジー"}])
category2_3.children.create([{name:"ビジネス"},{name:"エンタメ"},{name:"美容"},{name:"人間関係"},{name:"テクノロジー"}])