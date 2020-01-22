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

## Usage

### 税込金額計算
税抜金額を元に税込金額を計算します。
端数は切り捨てられます。

#### 通常税率の税込金額を計算
```ruby
Jptax.amount_with_tax(100)
# => 110
````

#### 軽減税率の税込金額を計算
```ruby
Jptax.amount_with_tax(0, 200)
# => 216
```

#### 通常税率と軽減税率の税込金額を計算
```ruby
Jptax.amount_with_tax(100, 200)
# => 316
```

## Note
計算間違いによる一切の責任は負えませんので、よくご確認の上ご利用ください。

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jptax project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/tomoeine/jptax/blob/master/CODE_OF_CONDUCT.md).
