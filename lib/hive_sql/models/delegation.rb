module HiveSQL
  class Delegation < HiveSQL::SqlBase

    self.table_name = :Delegations
    
    belongs_to :delegator_account, foreign_key: :delegator, primary_key: 'name', class_name: 'HiveSQL::Account'
    belongs_to :delegatee_account, foreign_key: :delegatee, primary_key: 'name', class_name: 'HiveSQL::Account'
    
    scope :delegator, lambda {|delegator| where(delegator: delegator)}
    scope :delegatee, lambda {|delegatee| where(delegatee: delegatee)}
    
    def mvests
      vests / 1e6
    end
  end
end

# Structure
#
# HiveSQL::Delegation(
#   delegator: varchar,
#   delegatee: varchar,
#   vests: money
# )
