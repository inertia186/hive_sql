module HiveSQL
  module Tx
    class AccountWitnessProxy < HiveSQL::SqlBase

      self.table_name = :TxAccountWitnessProxies
      
      scope :active, lambda { |account = nil|
        active = all
        active = active.where(proxy: account) if !!account
        
        ids = active.map do |p|
          p.id unless AccountWitnessProxy.where(account: p.account).
            where.not(proxy: p.proxy).
            where('timestamp > ?', p.timestamp).exists?
        end
        
        where(id: ids)
      }
    end
  end
end

# Structure
#
# HiveSQL::Tx::AccountWitnessProxy(
#   ID: integer,
#   tx_id: integer,
#   account: varchar,
#   proxy: varchar,
#   timestamp: datetime
# )
