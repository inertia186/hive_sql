require 'rubygems'
require 'bundler/setup'
require "hive_sql/version"

# Top Level Models
require "hive_sql/models/sql_base"
require "hive_sql/models/account"
require "hive_sql/models/block"
require "hive_sql/models/comment"
require "hive_sql/models/connection"
require "hive_sql/models/community"
require "hive_sql/models/community_subscriber"
require "hive_sql/models/community_role"
require "hive_sql/models/dynamic_global_properties"
require "hive_sql/models/follower"
require "hive_sql/models/reblog"
require "hive_sql/models/tag"
require "hive_sql/models/token"
require "hive_sql/models/transaction"
require "hive_sql/models/witness"

# Sub Level Models
require "hive_sql/models/tx/account_create"
require "hive_sql/models/tx/account_recover"
require "hive_sql/models/tx/account_update"
require "hive_sql/models/tx/account_witness_proxy"
require "hive_sql/models/tx/account_witness_vote"
require "hive_sql/models/tx/claim_reward_balance"
require "hive_sql/models/tx/comment"
require "hive_sql/models/tx/comments_option"
require "hive_sql/models/tx/convert"
require "hive_sql/models/tx/custom"
require "hive_sql/models/tx/delegate_vesting_share"
require "hive_sql/models/tx/delete_comment"
require "hive_sql/models/tx/escrow_approve"
require "hive_sql/models/tx/escrow_dispute"
require "hive_sql/models/tx/escrow_release"
require "hive_sql/models/tx/escrow_transfer"
require "hive_sql/models/tx/feed"
require "hive_sql/models/tx/limit_order"
require "hive_sql/models/tx/pow"
require "hive_sql/models/tx/transfer"
require "hive_sql/models/tx/update_proposal_vote"
require "hive_sql/models/tx/vote"
require "hive_sql/models/tx/withdraw"
require "hive_sql/models/tx/withdraw_vesting_route"
require "hive_sql/models/tx/witness_update"

require "hive_sql/models/tx/custom/follow"
require "hive_sql/models/tx/custom/witness"
require "hive_sql/models/tx/custom/reblog"
require "hive_sql/models/tx/custom/community"

require "hive_sql/models/vo/author_reward"
require "hive_sql/models/vo/comment_benefactor_reward"
require "hive_sql/models/vo/comment_payout_update"
require "hive_sql/models/vo/comment_reward"
require "hive_sql/models/vo/curation_reward"
require "hive_sql/models/vo/fill_convert_request"
require "hive_sql/models/vo/fill_order"
require "hive_sql/models/vo/fill_transfer_from_savings"
require "hive_sql/models/vo/fill_vesting_withdraw"
require "hive_sql/models/vo/interest"
require "hive_sql/models/vo/liquidity_reward"
require "hive_sql/models/vo/producer_reward"
require "hive_sql/models/vo/return_vesting_delegation"
require "hive_sql/models/vo/shutdown_witness"
require "hive_sql/models/vo/sps_fund"
require "hive_sql/models/vo/proposal_pay"

module HiveSQL
end

# Monkeypatch to implement: https://github.com/rails-sqlserver/activerecord-sqlserver-adapter/issues/274#issuecomment-167578393
# Copied from: https://github.com/rails-sqlserver/activerecord-sqlserver-adapter/blob/d4b6e4134e15d8d73be48ad6d8da1911f7001d9e/lib/active_record/connection_adapters/sqlserver/schema_statements.rb
# Switched "sp_helptext" from above (#view_information) to use "sp_columns"
module ActiveRecord
  module ConnectionAdapters
    module SQLServer
      module SchemaStatements
        def view_information(table_name)
          @view_information ||= {}
          @view_information[table_name] ||= begin
            identifier = SQLServer::Utils.extract_identifiers(table_name)
            view_info = select_one "SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = #{quote(identifier.object)}", 'SCHEMA'
            if view_info
              view_info = view_info.with_indifferent_access
              if view_info[:VIEW_DEFINITION].blank? || view_info[:VIEW_DEFINITION].length == 4000
                view_info[:VIEW_DEFINITION] = begin
                  select_values("EXEC sp_columns #{identifier.object_quoted}", 'SCHEMA').join
                rescue
                  warn "No view definition found, possible permissions problem.\nPlease run GRANT VIEW DEFINITION TO your_user;"
                  nil
                end
              end
            end
            view_info
          end
        end
      end
    end
  end
end
