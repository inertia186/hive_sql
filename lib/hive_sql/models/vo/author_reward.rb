module HiveSQL
  module Vo
    class AuthorReward < HiveSQL::SqlBase

      self.table_name = :VOAuthorRewards

    end
  end
end

# Structure
#
# HiveSQL::Vo::AuthorReward(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   author: varchar,
#   permlink: varchar,
#   hbd_payout: money,
#   hive_payout: money,
#   vesting_payout: money
# )
