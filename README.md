# Hive SQL

Access [HiveSQL.io](https://hivesql.io) data from your ruby/rails application.

[![Gem Version](https://badge.fury.io/rb/hive_sql.svg)](https://badge.fury.io/rb/hive_sql)

### How to Subscribe

**Note:** HiveSQL is a monthly subscription.  To use this gem, you must subscribe to @hivesql and store the credentials as environment variables.

See: https://hivesql.io

### Installation

First, install ruby.  One way to do this is install [rvm](https://rvm.io/install).  Once ruby is installed, install `hive_sql` with the `gem` command:

```bash
gem install hive_sql
```

Or, add it to your `Gemfile`:

```ruby
gem 'hive_sql'
```

### How To Use (Standalone)

```bash
gem install hive_sql
export STEEMSQL_HOST=<your hivesql host>
export STEEMSQL_USERNAME=<your hivesql username>
export STEEMSQL_PASSWORD=<your hivesql password>
hive_sql top upvoted
```

The above example will query the top upvoted content for the last 7 days.

### Models
- Account
- Block
  - Transaction
    - *various operations*
- Comment
- Community
  - Role
  - Subscriber
- Follower
- Reblog
- Tag
- Token
- Witness

### Followers

How to query today's followers:

```ruby
followers = HiveSQL::Tx::Custom::Follow
followers.following(:alice).today.count
```

### Resteem

How to query today's "resteems":

```ruby
reblogs = HiveSQL::Tx::Custom::Reblog
reblogs.author(:alice).today.count
```

### Account Witness Proxy

How to query current accounts that are actively using a proxy:

```ruby
proxied = HiveSQL::Tx::AccountWitnessProxy.active('alice')
proxied.pluck(:account)
```

### Applications

How to query comments by application:

```ruby
comments = HiveSQL::Comment.app('esteem').where(author: 'good-karma')
```

## Get in touch!

If you're using HiveSQL with ruby, I'd love to hear from you.  Drop me a line and tell me what you think!  I'm @inertia on STEEM.

Please note that this gem just provides access to the HiveSQL data services are provided by @arcange.

## License

I don't believe in intellectual "property".  If you do, consider Radiator as licensed under a Creative Commons [![CC0](http://i.creativecommons.org/p/zero/1.0/80x15.png)](http://creativecommons.org/publicdomain/zero/1.0/) License.
