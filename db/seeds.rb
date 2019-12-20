# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ss

1.times do |n| 
    @user =  User.create(name: "八幡",
                             email: "354@gmail.com",
                             password: "354@gmail.com",
                             )
 end


10.times do |n| 
    Article.create!(title: "自殺がない世界",
                            body: "私はこの世に自殺がなければどれだけ素晴らしいことかと考える。誰もが毎日笑顔で生活を送る姿を想像するだけで,私は笑顔になれる。でも皆が全員楽しい人生を送ることは現実問題難しいことは知っている。でも私は希望を持ちながら人生をあゆむと決めた",
                            user_id: @user.id,
                            )
end



10.times do |n| 
    Share.create!(declaration: "あなたはとても綺麗です",
                          user_id: @user.id,
                            )
end

