module HiveSQL
  module Vo
    class CurationReward < HiveSQL::SqlBase

      self.table_name = :VOCurationRewards

    end
  end
end

# Structure
#
# HiveSQL::Vo::CurationReward(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   curator: varchar,
#   author: varchar,
#   permlink: varchar,
#   reward: varchar
# )
