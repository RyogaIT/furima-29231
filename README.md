README修正１

+# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | date | null: false |
| password | date   | null: false |
| firstname| string   | null: false |
| lastname | string   | null: false |
| firstnamekana| string   | null: false |
| lastnamekana | string   | null: false |
| birthday | date   | null: false |

### Association

- has_many :items
- has_many :rooms, through: item_users
- has_many :comments



## items テーブル

| Column   | Type   | Options     |
| ------   | ------ | ----------- |
| image    | date | null: false   | ## active_storage テーブル #画像用
| product  | string | null: false |
| category | date | null: false |
| status   | date | null: false   |
| deliverycost | date | null: false |
| deliveryarea | date | null: false |
| deliverydates | date | null: false |
| price     | date | null: false |
| fee | date | null: false |
| profit | date | null: false |
| exhibior | string | null: false |

### Association

- has_many :item_users
- has_many :users, through: item_users
- has_many :comments





## item_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item




## comments テーブル
| Column   | Type   | Options     |
------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user



## buyers テーブル
| Column   | Type   | Options     |
|---------------------------------|
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association

- has_one : user
- has_one : item


## buyers_address テーブル
| Column   | Type   | Options     |
|---------------------------------|
| address    | references | null: false, foreign_key: true |

| image    | date | null: false   | ## active_storage テーブル #画像用
| product  | string | null: false |
| category | date | null: false |
| status   | date | null: false   |
| deliverycost | date | null: false |
| deliveryarea | date | null: false |
| deliverydays | date | null: false |
| price     | date | null: false |
| fee | date | null: false |
| profit | date | null: false |
| exhibior | date | null: false |

### Association

- has_one : buyers


