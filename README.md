README修正１

+# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string   | null: false |
| firstname| string   | null: false |
| lastname | string   | null: false |
| firstnamekana| string   | null: false |
| lastnamekana | string   | null: false |
| birthday | date   | null: false |

### Association

- has_many :items
- has_many : buyers
- has_many :comments



## items テーブル

| Column   | Type   | Options     |
| ------   | ------ | ----------- |
| productname  | string | null: false |
| producdetail  | text | null: false |
| category | integer | null: false |
| status   | integer | null: false   |
| deliverycost | integer | null: false |
| deliveryarea | integer | null: false |
| deliverydates | integer | null: false |
| price     | integer | null: false |
| exhibior | string | null: false |

### Association

- belongs_to :user
- has_one : buyer
- has_many :comments



## comments テーブル
| Column   | Type   | Options     |
------------------------------ |
| content| string     |                                |
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

- belong_to : user
- has_one : item
- has_one : buyers_address


## buyers_address テーブル
| Column   | Type   | Options     |
|---------------------------------|
| zipnumber    | integer | null: false   | 
| prefecture  | date | null: false |
| city | date | null: false |
| address   | date | null: false   |
| buildingname | string | null: false |
| phonenumber | integer | null: false |
| buyer   | references | null: false, foreign_key: true |


### Association

- has_one : buyer


