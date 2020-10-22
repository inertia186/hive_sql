module HiveSQL
  class Witness < HiveSQL::SqlBase
    DISABLED_SIGNING_KEY = 'STM1111111111111111111111111111111114T1Anm'

    self.table_name = :Witnesses
    
    belongs_to :account, foreign_key: :name, class_name: 'Account', primary_key: :name
    
    scope :disabled, lambda { |options = {invert: false}|
      if !!options[:invert]
        where.not(signing_key: DISABLED_SIGNING_KEY)
      else
        where(signing_key: DISABLED_SIGNING_KEY)
      end
    }
    
    scope :enabled, -> { disabled(invert: true) }
    
    scope :by_ranked, lambda { |order = :desc| order(votes_count: order) }
    scope :by_total_missed, lambda { |order = :desc| order(total_missed: order) }
  end
end

# Structure
#
# HiveSQL::Witness(
#   name: varchar,
#   votes_count: integer,
#   created: timestamp,
#   url: varchar,
#   votes: integer,
#   total_missed: integer,
#   last_aslot: integer,
#   last_confirmed_block_num: integer,
#   signing_key: varchar,
#   account_creation_fee: money,
#   account_creation_fee_symbol: varchar,
#   maximum_block_size: integer,
#   hbd_interest_rate: integer,
#   hbd_exchange_rate_base: money,
#   hbd_exchange_rate_base_symbol: varchar,
#   hbd_exchange_rate_quote: money,
#   hbd_exchange_rate_quote_symbol: varchar,
#   last_hbd_exchange_update: timestamp,
#   running_version: varchar,
#   hardfork_version_vote: varchar,
#   hardfork_time_vote: timestamp
# )
