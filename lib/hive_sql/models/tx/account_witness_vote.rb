module HiveSQL
  module Tx
    class AccountWitnessVote < HiveSQL::SqlBase
      belongs_to :account_record, foreign_key: :account, primary_key: :name, class_name: 'HiveSQL::Account'
      belongs_to :witness_record, foreign_key: :witness, primary_key: :name, class_name: 'HiveSQL::Account'
      
      self.table_name = :TxAccountWitnessVotes

    end
  end
end

# Structure
#
# HiveSQL::Tx::AccountWitnessVote(
#   ID: integer, 
#   tx_id: integer, 
#   account: varchar, 
#   witness: varchar, 
#   approve: boolean, 
#   timestamp: datetime
# )
