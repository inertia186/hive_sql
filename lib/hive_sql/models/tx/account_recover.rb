module HiveSQL
  module Tx
    class AccountRecover < HiveSQL::SqlBase

      self.table_name = :TxAccountRecovers

    end
  end
end

# Structure
#
# HiveSQL::Tx::AccountRecover(
#   ID: integer,
#   tx_id: integer,
#   recovery_account: varchar,
#   account_to_recover: varchar,
#   recovered: boolean,
#   timestamp: datetime
# )
