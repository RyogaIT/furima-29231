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
| name  | string | null: false |
| detail  | text | null: false |
| category | integer | null: false |
| status   | integer | null: false   |
| deliverycost | integer | null: false |
| deliveryarea | integer | null: false |
| deliverydates | integer | null: false |
| price     | integer | null: false |
| user  | reference | null: false, foreign_key: true |
| buyer | reference | null: false, foreign_key: true |

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



## item_buyers テーブル
| Column   | Type   | Options     |
|---------------------------------|
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association

- belongs_to : user
- has_many : items
- has_one : buyers_address


## buyers_address テーブル
| Column   | Type   | Options     |
|---------------------------------|
| zipnumber    | string | null: false   | 
| prefecture   | string | null: false   |
| city         | string | null: false |
| address      | string | null: false   |
| buildingname | string |              |
| phonenumber  | integer | null: false |
| buyer        | references | null: false, foreign_key: true |


### Association

- belongs_to : buyer


