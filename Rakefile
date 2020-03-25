require "bundler/gem_tasks"
require "rake/testtask"
require 'hive_sql'
require 'awesome_print'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
  t.ruby_opts << if ENV['HELL_ENABLED']
    '-W2'
  else
    '-W1'
  end
end

task :default => :test

task :console do
  exec "irb -r hive_sql -I ./lib"
end

namespace :created do
  desc 'Lists accounts created grouped by creator and date.'
  task :accounts, [:creator, :days_ago] do |t, args|
    now = Time.now.utc
    creator = args[:creator]
    after_timestamp = now - ((args[:days_ago] || '30').to_i * 86400)
    
    accounts = HiveSQL::Tx::AccountCreate.all
    
    if !!creator || creator == '%'
      unless creator == '%'
        accounts = accounts.where(creator: creator)
      end
    elsif creator =~ /.*%.*/
      accounts = accounts.where('creator LIKE ?', creator)
    end
    
    accounts = accounts.where('timestamp > ?', after_timestamp)
    accounts = accounts.group('CAST(timestamp AS DATE)', :creator)
    accounts = accounts.order('cast_timestamp_as_date ASC')

    accounts = accounts.count
    puts "# Daily creation count by #{creator.nil? ? 'all account creators' : creator} since #{after_timestamp} ..."
    ap accounts
    puts "# Total accounts: #{accounts.values.sum}"
  end
  
  desc 'Lists custom_json_operations grouped by id and date.'
  task :custom_json, [:id, :days_ago, :min_count] do |t, args|
    now = Time.now.utc
    tid = args[:id]
    after_timestamp = now - ((args[:days_ago] || '30').to_i * 86400)
    min_count = (args[:min_count] || 1).to_i
    
    customs = HiveSQL::Tx::Custom.all
    
    if !!tid && tid != '%' && tid =~ /.*%.*/
      customs = customs.where("tid LIKE ?", tid)
    elsif !!tid && tid != '%'
      customs = customs.where(tid: tid)
    end
    
    customs = customs.where('timestamp > ?', after_timestamp)
    customs = customs.group('CAST(timestamp AS DATE)', :tid)
    customs = customs.order('cast_timestamp_as_date ASC')

    customs = customs.count
    
    customs = customs.map do |k, v|
      [k, v] if v >= min_count
    end.compact.to_h
    
    puts "# Daily creation count by #{tid.nil? ? 'all custom_json_operation' : tid} since #{after_timestamp} ..."
    ap customs
    puts "# Total custom_json_operation: #{customs.values.sum}"
  end
end

desc 'Lists sum of transfers grouped by date, from, and to.'
task :transfers, [:minimum_amount, :symbol, :days_ago] do |t, args|
  now = Time.now.utc
  minimum_amount = (args[:minimum_amount] || '1000000').to_f
  symbol = (args[:symbol] || 'HIVE').upcase
  after_timestamp = now - ((args[:days_ago] || '30').to_i * 86400)
  
  # Only type: transfer; ignore savings, vestings
  transfers = HiveSQL::Tx::Transfer.where(type: 'transfer')
  transfers = transfers.where('amount > ?', minimum_amount)
  transfers = transfers.where('amount_symbol = ?', symbol)
  transfers = transfers.where('timestamp > ?', after_timestamp)
  transfers = transfers.group('CAST(timestamp AS DATE)', :from, :to)
  transfers = transfers.order('cast_timestamp_as_date ASC')
  
  puts "Daily transfer sum over #{'%.3f' % minimum_amount} #{symbol} since #{after_timestamp} ..."
  ap transfers.sum(:amount)
end

desc 'Lists sum of powered up grouped by date, from, and to.'
task :powerup, [:minimum_amount, :symbol, :days_ago, :not_to_self] do |t, args|
  now = Time.now.utc
  minimum_amount = (args[:minimum_amount] || '500').to_f
  symbol = (args[:symbol] || 'HIVE').upcase
  after_timestamp = now - ((args[:days_ago] || '30').to_i * 86400)
  not_to_self = (args[:not_to_self] || 'false') == 'true'
  
  minimum_amount = case symbol
  when 'MVESTS' then minimum_amount * 1e6 #TODO
  when 'VESTS' then minimum_amount # TODO
  when 'HIVE' then minimum_amount
  else; raise "Unknown symbol: #{symbol}"
  end
  
  # Only type: transfer; ignore savings, vestings
  transfers = HiveSQL::Tx::Transfer.where(type: 'transfer_to_vesting')
  transfers = transfers.where('amount > ?', minimum_amount)
  transfers = transfers.where('amount_symbol = ?', 'HIVE')
  transfers = transfers.where('timestamp > ?', after_timestamp)
  transfers = transfers.group('CAST(timestamp AS DATE)', :from, :to)
  transfers = transfers.order('cast_timestamp_as_date ASC')
  
  transfers = transfers.sum(:amount)
  
  if not_to_self
    transfers = transfers.map do |k, v|
      [k, v] if k[1] != k[2]
    end.compact.to_h
  end
  
  puts "# Daily transfer sum over #{'%.3f' % minimum_amount} #{symbol} #{not_to_self ? '' : 'not to self '}since #{after_timestamp} ..."
  ap transfers
  puts "# Total #{symbol}: #{transfers.values.sum}"
end

desc 'Lists sum of powered down grouped by date, from, and to.'
task :powerdown, [:minimum_amount, :symbol, :days_ago, :not_to_self] do |t, args|
  now = Time.now.utc
  minimum_amount = (args[:minimum_amount] || '500').to_f
  symbol = (args[:symbol] || 'HIVE').upcase
  after_timestamp = now - ((args[:days_ago] || '30').to_i * 86400)
  not_to_self = (args[:not_to_self] || 'false') == 'true'
  
  minimum_amount = case symbol
  when 'MVESTS' then minimum_amount * 1e6 #TODO
  when 'VESTS' then minimum_amount # TODO
  when 'HIVE' then minimum_amount
  else; raise "Unknown symbol: #{symbol}"
  end
  
  # Only type: transfer; ignore savings, vestings
  transfers = HiveSQL::Tx::Transfer.where(type: 'transfer_to_vesting')
  transfers = transfers.where('amount > ?', minimum_amount)
  transfers = transfers.where('amount_symbol = ?', 'HIVE')
  transfers = transfers.where('timestamp > ?', after_timestamp)
  transfers = transfers.group('CAST(timestamp AS DATE)', :from, :to)
  transfers = transfers.order('cast_timestamp_as_date ASC')
  
  transfers = transfers.sum(:amount)
  
  if not_to_self
    transfers = transfers.map do |k, v|
      [k, v] if k[1] != k[2]
    end.compact.to_h
  end
  
  puts "# Daily transfer sum over #{'%.3f' % minimum_amount} #{symbol} #{not_to_self ? '' : 'not to self '}since #{after_timestamp} ..."
  ap transfers
  puts "# Total #{symbol}: #{transfers.values.sum}"
end

desc 'Lists apps grouped by date, app/version.'
task :apps, [:app, :days_ago] do |t, args|
  now = Time.now.utc
  app = args[:app]
  after_timestamp = now - ((args[:days_ago] || '7').to_i * 86400)
  
  comments = HiveSQL::Comment.normalized_json
  comments = comments.app(app) if !!app
  comments = comments.where('created > ?', after_timestamp)
  comments = comments.group('CAST(created AS DATE)', "JSON_VALUE(json_metadata, '$.app')")
  comments = comments.order('cast_created_as_date ASC')
  
  matching = " matching \"#{app}\"" if !!app
  puts "Daily app#{matching} count since #{after_timestamp} ..."
  ap comments.count(:all)
end

desc 'Lists app names grouped by date, app/version.'
task :app_names, [:app, :days_ago] do |t, args|
  now = Time.now.utc
  app = args[:app]
  after_timestamp = now - ((args[:days_ago] || '7').to_f * 86400)
  
  comments = HiveSQL::Comment.normalized_json
  comments = comments.app(app) if !!app
  comments = comments.where('created > ?', after_timestamp)
  comments = comments.group('CAST(created AS DATE)', "JSON_VALUE(json_metadata, '$.app')")
  comments = comments.order('cast_created_as_date ASC')
  
  matching = " matching \"#{app}\"" if !!app
  puts "# Daily app#{matching} count since #{after_timestamp} ..."
  
  app_names = {}
  
  comments.count(:all).each do |k, v|
    date, app = k
    if !!app && app.include?('/')
      name, version = app.split('/')
      app_names[[date, name]] ||= 0.0
      app_names[[date, name]] += v
    end
  end
  
  ap app_names
end

desc 'Do all crosschecks of given account.'
task :crosscheck, [:account] do |t, args|
  account = args[:account]
    
  Rake::Task["crosscheck:powerdowns"].invoke(account)
  Rake::Task["crosscheck:powerups"].invoke(account)
  Rake::Task["crosscheck:transfers"].invoke(account)
  Rake::Task["crosscheck:vesting_from"].invoke(account)
  Rake::Task["crosscheck:vesting_to"].invoke(account)
end
  
namespace :crosscheck do
  desc 'List of accounts grouped by transfer count crosschecked by memo of given account.'
  task :transfers, [:account] do |t, args|
    exchanges = %w(bittrex poloniex openledger blocktrades deepcrypto8 gopax
      binanceexchange teambitwala changelly hitbtc-exchange korbit roomofsatoshi
      shapeshiftio)
    account = args[:account]
    
    if account.nil? || account == ''
      puts 'Account name required.'
      exit
    elsif exchanges.include? account
      puts 'That procedure is not recommended.'
      exit
    end
    
    all = HiveSQL::Tx::Transfer.where(type: 'transfer')
    transfers = all.where.not(memo: '')
    transfers = transfers.where(to: exchanges)
    transfers = if account =~ /%/
      table = HiveSQL::Tx::Transfer.arel_table
      transfers.where(table[:from].matches(account))
    else
      transfers.where(from: account)
    end
    crosscheck_transfers = all.where(memo: transfers.select(:memo))
    
    if transfers.none?
      puts "No match."
    else
      from = transfers.pluck(:from).uniq.join(', ')
      puts "Accounts grouped by transfer count using common memos as #{from} on common exchanges ..."
      ap crosscheck_transfers.group(:from).order('count_all').count(:all)
    end
  end
  
  desc 'List of accounts grouped by vesting transfers from a given account'
  task :vesting_from, [:account] do |t, args|
    account = args[:account]
    
    if account.nil? || account == ''
      puts 'Account name required.'
      exit
    end
    
    table = HiveSQL::Tx::Transfer.arel_table
    all = HiveSQL::Tx::Transfer.where(type: 'transfer_to_vesting')
    transfers = all.where(table[:from].not_eq(:to))
    transfers = transfers.where.not(to: '')
    transfers = if account =~ /%/
      table = HiveSQL::Tx::Transfer.arel_table
      transfers.where(table[:from].matches(account))
    else
      transfers.where(from: account)
    end
    
    if transfers.none?
      puts "No match."
    else
      from = transfers.pluck(:from).uniq.join(', ')
      puts "Accounts grouped by vesting transfer count from #{from} ..."
      ap transfers.group(:to).order('count_all').count(:all)
    end
  end
  
  desc 'List of accounts grouped by vesting transfers to a given account'
  task :vesting_to, [:account] do |t, args|
    account = args[:account]
    
    if account.nil? || account == ''
      puts 'Account name required.'
      exit
    end
    
    table = HiveSQL::Tx::Transfer.arel_table
    all = HiveSQL::Tx::Transfer.where(type: 'transfer_to_vesting')
    transfers = all.where(table[:from].not_eq(table[:to]))
    transfers = transfers.where.not(to: '')
    transfers = if account =~ /%/
      table = HiveSQL::Tx::Transfer.arel_table
      transfers.where(table[:to].matches(account))
    else
      transfers.where(to: account)
    end
    
    if transfers.none?
      puts "No match."
    else
      from = transfers.pluck(:to).uniq.join(', ')
      puts "Accounts grouped by vesting transfer count to #{from} ..."
      ap transfers.group(:from).order('count_all').count(:all)
    end
  end
  
  desc 'List of accounts grouped by powerdown sums crosschecked by given account.'
  task :powerdowns, [:account] do |t, args|
    account = args[:account]
    
    if account.nil? || account == ''
      puts 'Account name required.'
      exit
    end
    
    table = HiveSQL::Vo::FillVestingWithdraw.arel_table
    all = HiveSQL::Vo::FillVestingWithdraw.where(table[:from_account].not_eq(table[:to_account]))
    powerdowns = if account =~ /%/
      all.where(table[:from_account].matches(account))
    else
      all.where(from_account: account)
    end
    
    if powerdowns.none?
      puts "No match."
    else
      from = powerdowns.pluck(:from_account).uniq.join(', ')
      puts "Powerdowns grouped by sum from #{from} ..."
      ap powerdowns.group(:to_account).
        order('sum_try_parse_replace_withdrawn_vests_as_float').
        sum("TRY_PARSE(REPLACE(withdrawn, ' VESTS', '') AS float)")
    end
  end
  
  desc 'List of accounts grouped by powerup sums crosschecked by given account.'
  task :powerups, [:account] do |t, args|
    account = args[:account]
    
    if account.nil? || account == ''
      puts 'Account name required.'
      exit
    end
    
    table = HiveSQL::Vo::FillVestingWithdraw.arel_table
    all = HiveSQL::Vo::FillVestingWithdraw.where(table[:from_account].not_eq(table[:to_account]))
    powerups = if account =~ /%/
      all.where(table[:to_account].matches(account))
    else
      all.where(to_account: account)
    end
    
    if powerups.none?
      puts "No match."
    else
      to = powerups.pluck(:to_account).uniq.join(', ')
      puts "Powerups grouped by sum to #{to} ..."
      ap powerups.group(:from_account).
        order('sum_try_parse_replace_withdrawn_vests_as_float').
        sum("TRY_PARSE(REPLACE(withdrawn, ' VESTS', '') AS float)")
    end
  end
end

namespace :rewards do
  desc 'Lists author rewards grouped by date.'
  task :author, [:symbol, :days_ago, :author] do |t, args|
    now = Time.now.utc
    symbol = (args[:symbol] || 'HBD').upcase
    after_timestamp = now - ((args[:days_ago] || '7').to_i * 86400)
    author = args[:author]
    
    rewards = HiveSQL::Vo::AuthorReward
    rewards = rewards.where('timestamp > ?', after_timestamp)
    rewards = rewards.group('CAST(timestamp AS DATE)')
    rewards = rewards.order('cast_timestamp_as_date ASC')
    
    if !!author
      if author =~ /%/
        rewards = rewards.where("author LIKE ?", author)
      else
        rewards = rewards.where(author: author)
      end
      
      puts "Daily #{author} reward #{symbol} sum grouped by date since #{after_timestamp} ..."
    else
      puts "Daily reward #{symbol} sum grouped by date since #{after_timestamp} ..."
    end
    
    rewards = case symbol
    when 'HBD' then rewards.sum(:sbd_payout)
    when 'HIVE' then rewards.sum(:steem_payout)
    when 'VESTS' then rewards.sum(:vesting_payout)
    when 'MVESTS'
      rewards.sum('vesting_payout / 1000000')
    else; puts "Unknown symbol: #{symbol}.  Symbols supported: HBD, HIVE, VESTS, MVESTS"
    end
    
    ap rewards
    sum = rewards.values.sum
    puts "# Total rewards: %.3f %s (average: %.3f per day)" % [sum, symbol, (sum / rewards.size)]
  end

  desc 'Lists curation rewards grouped by date.'
  task :curation, [:symbol, :days_ago] do |t, args|
    now = Time.now.utc
    symbol = (args[:symbol] || 'MVESTS').upcase
    after_timestamp = now - ((args[:days_ago] || '7').to_i * 86400)
    
    rewards = HiveSQL::Vo::CurationReward
    rewards = rewards.where('timestamp > ?', after_timestamp)
    rewards = rewards.group('CAST(timestamp AS DATE)')
    rewards = rewards.order('cast_timestamp_as_date ASC')
    
    puts "Daily curation reward #{symbol} sum grouped by date since #{after_timestamp} ..."
    
    case symbol
    when 'VESTS'
      ap rewards.sum("TRY_PARSE(REPLACE(reward, ' VESTS', '') AS float)")
    when 'MVESTS'
      ap rewards.sum("TRY_PARSE(REPLACE(reward, ' VESTS', '') AS float) / 1000000")
    else; puts "Unknown symbol: #{symbol}.  Symbols supported: VESTS, MVESTS"
    end
  end
end

desc 'Lists proxied grouped by month.'
task :proxied, [:days_ago] do |t, args|
  now = Time.now.utc
  after_timestamp = now - ((args[:days_ago] || '7').to_i * 86400)
  
  proxied = HiveSQL::Tx::AccountWitnessProxy
  proxied = proxied.where('timestamp > ?', after_timestamp)
  proxied = proxied.group("FORMAT(timestamp, 'yyyy-MM')", :proxy)
  proxied = proxied.order('format_timestamp_yyyy_mm ASC')
  
  puts "Daily proxied grouped by month since #{after_timestamp} ..."
  
  ap proxied.count(:all)
end

desc <<~EOF
  Claimed Rewards.
  Use the "account_name" of a user or '%' to match on any user.
EOF
task :claimed, [:account_name, :days_ago, :symbol] do |t, args|
  now = Time.now.utc
  account_name = args[:account_name] || '%'
  after_timestamp = now - ((args[:days_ago] || '30').to_i * 86400)
  symbol = (args[:symbol] || 'vests').downcase.to_sym
  claims = HiveSQL::Tx::ClaimRewardBalance.where('timestamp > ?', after_timestamp)

  claims = if account_name =~ /%/
    claims.where('account LIKE ?', account_name)
  else
    claims.where(account: account_name)
  end
  
  claims = case symbol
    when :vests then claims.where("reward_vests > 0")
    when :mvests then claims.where("reward_vests > 0")
    when :hive then claims.where("reward_steem > 0")
    when :hbd then claims.where("reward_sbd > 0")
    else; raise "Unknown symbol: #{symbol.to_s.upcase} (allowed: VESTS, MVESTS, HIVE, HBD)"
  end
    
  claims = claims.group("FORMAT(timestamp, 'yyyy-MM')")
  claims = claims.order('format_timestamp_yyyy_mm ASC')
  
  claims = case symbol
    when :vests then claims.sum(:reward_vests)
    when :mvests then claims.sum('reward_vests / 1000000')
    when :hive then claims.sum(:reward_steem)
    when :hbd then claims.sum(:reward_sbd)
  end
  
  puts "# Claimed rewards in #{symbol.to_s.upcase} sum grouped by month ..."

  ap claims
  puts "# Total claimed #{symbol}: #{claims.values.sum}"
end

desc <<~EOF
  Balance for given parties.
  Where "party_a" is the first account, "party_b" is the second account and "symbol" is a valid native symbol.
EOF
task :balance, [:party_a, :party_b, :symbol] do |t, args|
  party_a = args[:party_a]
  party_b = args[:party_b]
  symbol = args[:symbol].upcase
  
  balance_a = HiveSQL::Tx::Transfer.where(to: party_a, from: party_b, amount_symbol: symbol).sum(:amount).to_f
  balance_b = HiveSQL::Tx::Transfer.where(to: party_b, from: party_a, amount_symbol: symbol).sum(:amount).to_f
  
  puts "#{party_a}: %.3f #{symbol}, difference: %.3f #{symbol}" % [balance_a, (balance_a - balance_b)]
  puts "#{party_b}: %.3f #{symbol}, difference: %.3f #{symbol}" % [balance_b, (balance_b - balance_a)]
end

desc <<~EOF
  Top what ... 
  Allowed \"what\" options: upvoted downvoted
EOF
task :top, [:what, :limit] do |t, args|
  what = args[:what].to_s.downcase.to_sym
  limit = (args[:limit] || '10').to_i
  since = 1.week.ago
  
  case what
  when :upvoted, :downvoted
    comments = HiveSQL::Comment.after(since)
    comments = if what == :upvoted
      comments.where('net_rshares > 0')
      comments = comments.order('sum_net_rshares DESC')
    elsif what == :downvoted
      comments.where('net_rshares < 0')
      comments = comments.order('sum_net_rshares ASC')
    end
    
    comments = comments.group(:author, :permlink, :created)
    comments = comments.limit(limit)
    
    comments = comments.sum(:net_rshares)
    
    comments.each do |k, v|
      url = "https://hive.blog/@#{k[0]}/#{k[1]}"
      created = (Time.now - k[2]) / 60 / 60 / 24
      
      puts "#{v}; #{created.round(2)} days ago: #{url}"
    end
  end
end

# Doesn't look like this table exists.
# desc 'List conversion HBD conversion request sums grouped by day.'
# task :convert, [:days_ago] do |t, args|
#   now = Time.now.utc
#   after_timestamp = now - ((args[:days_ago] || '3.5').to_f * 86400)
# 
#   converts = HiveSQL::Vo::FillConvertRequest
#   converts = converts.where('timestamp > ?', after_timestamp)
#   converts = converts.group('CAST(timestamp AS DATE)')
#   converts = converts.order('cast_timestamp_as_date ASC')
# 
#   puts "Daily conversion requests failled sum grouped by date since #{after_timestamp} ..."
#   ap converts.sum(:amount)
# end

desc 'Build a new version of the hive_sql gem.'
task :build do
  exec 'gem build hive_sql.gemspec'
end

desc 'Publish the current version of the hive_sql gem.'
task :push do
  exec "gem push hive_sql-#{HiveSQL::VERSION}.gem"
end

# We're not going to yank on a regular basis, but this is how it's done if you
# really want a task for that for some reason.

# desc 'Yank the current version of the hive_sql gem.'
# task :yank do
#   exec "gem yank hive_sql -v #{HiveSQL::VERSION}"
# end
