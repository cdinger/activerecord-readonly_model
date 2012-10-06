# ActiveRecord::ReadonlyModel

 `ActiveRecord:ReadonlyModel` does what you'd think. It makes any
ActiveRecord model read only. Any attempt to persist changes to a
read-only model will result in an `ActiveRecord::ReadOnlyRecord`
exception.

Read-only models are useful when you're storing 'static' kind of data
like descriptive types or statuses that don't change while your application is
executing.

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-readonly_model'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-readonly_model

## Usage

To use, just include the `ActiveRecord::ReadonlyModel` module in your
model:

    class ThingStatus < ActiveRecord::Base
      include ActiveRecord::ReadonlyModel
    end

Any attempt to update or destroy an instance of `ThingStatus` will raise an
`ActiveRecord::ReadOnlyRecord` exception.

## Bypass

Of course sometimes you'll want to bypass the read-only restriction
(like when seeding your database). To temporarily bypass, make
updates/inserts/deletes in a bypass block:

    ActiveRecord::ReadonlyModel.bypass do
      ThingStatus.create(:name => 'Active', :description => 'An active thing')
    end

## Limitations

This gem will only prevent creates, saves, and destroys. `.delete()` and
`.delete_all()` behavior is unaffected by this gem!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
