# ParamsBuilder

Build params.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "params_builder"

```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install params_builder

## Usage

1. Set file_path for ParamsBuilder.

If you are using Rails, by default ParamsBuilder will set file_path with 
`"#{Rails.root}/spec/params_builders"`.


```ruby

  ParamsBuilder.configure do |config|
    config.file_path = "#{Rails.root}/spec/params_builders"
  end

```

2. Touch a new file like `company_params.yml.erb` in specify folder.

```ruby

  name: <%= company.name %>
  logo: <%= company.logo %>
  owner: <%= owner.name %>
  images_attributes:
    - url: "a.jpg"
    - url: "b.jpg"

```

3. Get params from this file.

```ruby
  class Company
    attr_accessor :name, :logo
  end

  class User
    attr_accessor :name
  end

  company = Company.new(name: "apple", logo: "xxx.jpg")
  user = User.new(name: "jack")

  ParamsBuilder.build(:company_params, owner: user, company: company)
  
  # The first parameter we pass is the name of file
  # `owner` and `company` will be the available variables to use in erb.

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/params_builder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

