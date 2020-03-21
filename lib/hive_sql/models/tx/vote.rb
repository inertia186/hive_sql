module HiveSQL
  module Tx
    class Vote < HiveSQL::SqlBase

      self.table_name = :TxVotes
    
    end
  end
end

# Structure
#
# HiveSQL::Tx::Vote(
#   ID: integer,
#   tx_id: integer,
#   voter: varchar,
#   author: varchar,
#   permlink: varchar,
#   weight: integer,
#   timestamp: datetime
# )
