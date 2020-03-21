module HiveSQL
  module Vo
    class FillVestingWithdraw < HiveSQL::SqlBase

      self.table_name = :VOFillVestingWithdraws

    end
  end
end

# Structure
#
# HiveSQL::Vo::FillVestingWithdraw(
#   ID: integer,
#   block_num: integer,
#   timestamp: datetime,
#   from_account: varchar,
#   to_account: varchar,
#   withdrawn: varchar,
#   deposited: varchar
# )
