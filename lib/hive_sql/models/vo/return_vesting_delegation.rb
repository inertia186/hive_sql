module HiveSQL
  module Vo
    class ReturnVestingDelegation < HiveSQL::SqlBase

      self.table_name = :VOReturnVestingDelegations

    end
  end
end

# Structure
#
# HiveSQL::Vo::ReturnVestingDelegation(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   account: varchar,
#   amount: money,
#   amount_symbol
# )
