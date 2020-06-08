# Jptax

Jptax は日本の消費税額を計算します。

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jptax'
```

And then execute:

```shell
$ bundle install
```

Or install it yourself as:

```shell
$ gem install jptax
```

## Reference

```ruby
Jptax.amount_with_tax(通常税率の税抜金額, 軽減税率の税抜金額, 丸め方法)
```

### 丸め方法
端数の丸方法として、以下のいずれかを指定します。
未指定の場合は切り捨てられます。
- `floor`: 切り捨て
- `ceil`: 切り上げ
- `round`: 四捨五入


## Usage

### 税込金額計算
税抜金額を元に税込金額を計算します。
端数は切り捨て・切り上げ・四捨五入を指定できます。
未指定の場合は切り捨てられます。

#### 通常税率の税込金額を計算（切り捨て）
```ruby
Jptax.amount_with_tax(100)
# => 110
````

#### 軽減税率の税込金額を計算（切り捨て）
```ruby
Jptax.amount_with_tax(0, 200)
# => 216
```

#### 通常税率と軽減税率の税込金額を計算（切り捨て）
```ruby
Jptax.amount_with_tax(100, 199)
# => 314
```

#### 通常税率と軽減税率の税込金額を計算（四捨五入）
```ruby
Jptax.amount_with_tax(100, 199, 'round')
# => 315
```

## Note
計算間違いによる一切の責任は負えませんので、よくご確認の上ご利用ください。

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jptax project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/tomoeine/jptax/blob/master/CODE_OF_CONDUCT.md).
