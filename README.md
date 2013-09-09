# LabelMe

LabelMe is an easy accessor for ColorMe Order CSV.


## Installation

Add this line to your application's Gemfile:

    gem 'label_me', github: "xxxcaqui/label_me"

And then execute:

    $ bundle


## Usage

```ruby
orders = LabelMe::SalesAll.parse("sales_all.csv")

orders.first.order_id #=> "12342345"
```


## Attributes

### General

| Column in CSV | Accessor method |
|------|------|
|売上ID|order_id|
|受注日|order_date|

### Customer

| Column in CSV | Accessor method |
|------|------|
|購入者 顧客ID|customer_id|
|購入者 名前|customer_name|
|購入者 郵便番号|customer_postal_code|
|購入者 都道府県, 購入者 住所|customer_address|
|購入者 メールアドレス|customer_email|
|購入者 電話番号|customer_phone_number|
|送料合計|total_shipping_charge|
|メッセージカード手数料合計|total_message_card_charge|
|入金状態|paid?|

### Recipient

| Column in CSV | Accessor method |
|------|------|
|配送先ID|recipient_id|
|配送先 名前|recipient_name|
|配送先 フリガナ|recipient_kana|
|配送先 郵便番号|recipient_postal_code|
|配送先 都道府県名, 配送先 住所|recipient_address|
|配送先 電話番号|recipient_phone_number|
|配送希望日|wished_delivery_date|
|配送希望時間|wished_delivery_timezone|
|配送先 熨斗（のし）|recipient_labeling|
|配送先 メッセージカード種類|recipient_message_card_type|
|配送先 メッセージカード内容|recipient_message_card_body|
|配送先 備考|recipient_notes|

### Line Item

| Column in CSV | Accessor method |
|------|------|
|売上詳細ID|line_item_id|
|購入商品 商品ID|line_item_code|
|購入商品 販売価格(消費税込)|line_item_unit_price|
|購入商品 販売個数|line_item_quantity|


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
