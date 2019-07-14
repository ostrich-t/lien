# readme

## usersテーブル
|Column|Type|Options|
|nickname|string|null: false|
|email|string|
|password|

### Association
- has_many :usergroup
- has_many :groups, through: :usergroup
- has_many :chat
- has_one :profile

## profile
|Column|Type|Options|
|gender|string|
|birth-info|date|
|residence|string|
|hobby|string|
|job|string|
|text|text|
|user_id|references|foreign_key: true|

- belongs_to :user

## group
|Column|Type|Options|
|title|string|null: false|
|description|text|null: false|
|user_id|references|null: false, foreign_key: ture|

### Association
- has_many :usergroup
- has_many :users, through: :usergroup
- has_many :chat
- has_one :bulletin_board

## usergroup（中間テーブル）
|Column|Type|Options|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## relation
|Column|Type|Options|
|user_id|references|foreign_key: true|
|follower_id|integer|foreign_key: true|

## chat
|Column|Type|Options|
|text|text|
|image|string|
|user_id|references|foreign_key: true|
|group_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## bulletin-board
|Column|Type|Options|
|text|text|null: false|
|group_id|references|foreign_key: true|

### Association
- belongs_to :group
