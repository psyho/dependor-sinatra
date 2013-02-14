# dependor-sinatra

This gem provides integration between [Dependor][dependor] and [Sinatra][sinatra].

## Installation

Add this line to your application's Gemfile:

    gem 'dependor-sinatra'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dependor-sinatra

## Usage

Require dependor-sinatra:

    require 'dependor-sinatra'

and (optionally), the shortcut notation for defining constructors:

    require 'dependor/shorty'

This teaches Sinatra to inject dependencies into your actions:

```ruby
class Greeter
  takes :params

  def greet
    "Hello, #{params[:name]}!"
  end
end

get "/hello/:login" do |greeter|
  greeter.greet
end
```

You can specify your own injector:

```ruby
# this is exacly how the default injector class (Dependor::Sinatra::DefaultInjector) 
# looks like
class MyInjector
  include Dependor::AutoInject
  include Dependor::Sinatra::Objects

  def initialize(objects)
    sinatra_objects(objects)
  end

  # define anything you want here
  def user_db
    User
  end
end

injector{ |objects| MyInjector.new(objects) }

get "/" do |user_db|
  @users = user_db.all
end
```

You can dependency injection in the following Sinatra elements:

- routes (`get`, `post`, `put`, etc.)
- filters (`before`, `after`)
- conditions (`condition`)

By default, you can inject the following objects from Sinatra:

- params
- session
- request
- response
- env

You can read more about Dependor [here][dependor].

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT

## Author

Adam Pohorecki (adam [at] pohorecki [dot] pl)

[dependor]: https://github.com/psyho/dependor
[sinatra]: http://sinatrarb.com
