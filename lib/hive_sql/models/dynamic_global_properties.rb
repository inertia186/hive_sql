module HiveSQL
  class DynamicGlobalProperties < HiveSQL::SqlBase

    self.table_name = :DynamicGlobalProperties

  end
end

# Structure
#
# HiveSQL::DynamicGlobalProperties(
#   ID: integer,
#   head_block_number: integer,
#   head_block_id: varchar,
#   time: timestamp,
#   current_witness: varchar,
#   total_pow: integer,
#   num_pow_witnesses: integer,
#   virtual_supply: money,
#   current_supply: money,
#   confidential_supply: money,
#   current_hbd_supply: money,
#   confidential_hbd_supply: money,
#   total_vesting_fund_hive: money,
#   total_vesting_fund_hive_symbol: varchar,
#   total_vesting_shares: money,
#   total_vesting_shares_symbol: varchar,
#   total_reward_fund_hive: money,
#   total_reward_shares2: varchar,
#   pending_rewarded_vesting_shares: varchar,
#   pending_rewarded_vesting_hive: varchar,
#   hbd_interest_rate: integer,
#   hbd_print_rate: integer,
#   average_block_size: integer,
#   maximum_block_size: integer,
#   current_aslot: integer,
#   recent_slots_filled: varchar,
#   participation_count: integer,
#   last_irreversible_block_num: integer,
#   max_virtual_bandwidth: varchar,
#   vote_power_reserve_rate: integer,
#   current_reserve_ratio: integer,
#   vote_regeneration_per_day: integer,
#   hive_per_vest: money
# )
