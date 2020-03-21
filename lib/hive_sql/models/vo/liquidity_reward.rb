module HiveSQL
  module Vo
    class LiquidityReward < HiveSQL::SqlBase

      self.table_name = :VOLiquidityRewards

    end
  end
end

# Structure
#
# HiveSQL::Vo::LiquidityReward(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   owner: varchar,
#   payout: money
# )
