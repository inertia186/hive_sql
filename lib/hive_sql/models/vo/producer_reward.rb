module HiveSQL
  module Vo
    class ProducerReward < HiveSQL::SqlBase

      self.table_name = :VOProducerRewards

    end
  end
end

# Structure
#
# HiveSQL::Vo::ProducerReward(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   producer: varchar,
#   vesting_shares: money
# )
