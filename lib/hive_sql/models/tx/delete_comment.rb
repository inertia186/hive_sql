module HiveSQL
  module Tx
    class DeleteComment < HiveSQL::SqlBase

      self.table_name = :TxDeleteComments

    end
  end
end

# Structure
#
# HiveSQL::Tx::DeleteComment(
#   ID: integer,
#   tx_id: integer,
#   author: varchar,
#   permlink: varchar_max,
#   timestamp: datetime
# )
