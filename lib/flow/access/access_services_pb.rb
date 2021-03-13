# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: flow/access/access.proto for package 'flow.access'

require 'grpc'
require 'flow/access/access_pb'

module Flow
  module Access
    module AccessAPI
      # AccessAPI is the public-facing API provided by access nodes.
      class Service

        include GRPC::GenericService

        self.marshal_class_method = :encode
        self.unmarshal_class_method = :decode
        self.service_name = 'flow.access.AccessAPI'

        # Ping is used to check if the access node is alive and healthy.
        rpc :Ping, ::Flow::Access::PingRequest, ::Flow::Access::PingResponse
        # Block Headers
        #
        # GetLatestBlockHeader gets the latest sealed or unsealed block header.
        rpc :GetLatestBlockHeader, ::Flow::Access::GetLatestBlockHeaderRequest, ::Flow::Access::BlockHeaderResponse
        # GetBlockHeaderByID gets a block header by ID.
        rpc :GetBlockHeaderByID, ::Flow::Access::GetBlockHeaderByIDRequest, ::Flow::Access::BlockHeaderResponse
        # GetBlockHeaderByHeight gets a block header by height.
        rpc :GetBlockHeaderByHeight, ::Flow::Access::GetBlockHeaderByHeightRequest, ::Flow::Access::BlockHeaderResponse
        # Blocks
        #
        # GetLatestBlock gets the full payload of the latest sealed or unsealed block.
        rpc :GetLatestBlock, ::Flow::Access::GetLatestBlockRequest, ::Flow::Access::BlockResponse
        # GetBlockByID gets a full block by ID.
        rpc :GetBlockByID, ::Flow::Access::GetBlockByIDRequest, ::Flow::Access::BlockResponse
        # GetBlockByHeight gets a full block by height.
        rpc :GetBlockByHeight, ::Flow::Access::GetBlockByHeightRequest, ::Flow::Access::BlockResponse
        # Collections
        #
        # GetCollectionByID gets a collection by ID.
        rpc :GetCollectionByID, ::Flow::Access::GetCollectionByIDRequest, ::Flow::Access::CollectionResponse
        # Transactions
        #
        # SendTransaction submits a transaction to the network.
        rpc :SendTransaction, ::Flow::Access::SendTransactionRequest, ::Flow::Access::SendTransactionResponse
        # GetTransaction gets a transaction by ID.
        rpc :GetTransaction, ::Flow::Access::GetTransactionRequest, ::Flow::Access::TransactionResponse
        # GetTransactionResult gets the result of a transaction.
        rpc :GetTransactionResult, ::Flow::Access::GetTransactionRequest, ::Flow::Access::TransactionResultResponse
        # Accounts
        #
        # GetAccount is an alias for GetAccountAtLatestBlock.
        #
        # Warning: this function is deprecated. It behaves identically to GetAccountAtLatestBlock and will be removed in a future version.
        rpc :GetAccount, ::Flow::Access::GetAccountRequest, ::Flow::Access::GetAccountResponse
        # GetAccountAtLatestBlock gets an account by address from the latest sealed execution state.
        rpc :GetAccountAtLatestBlock, ::Flow::Access::GetAccountAtLatestBlockRequest, ::Flow::Access::AccountResponse
        # GetAccountAtBlockHeight gets an account by address at the given block height
        rpc :GetAccountAtBlockHeight, ::Flow::Access::GetAccountAtBlockHeightRequest, ::Flow::Access::AccountResponse
        # Scripts
        #
        # ExecuteScriptAtLatestBlock executes a read-only Cadence script against the latest sealed execution state.
        rpc :ExecuteScriptAtLatestBlock, ::Flow::Access::ExecuteScriptAtLatestBlockRequest, ::Flow::Access::ExecuteScriptResponse
        # ExecuteScriptAtBlockID executes a ready-only Cadence script against the execution state at the block with the given ID.
        rpc :ExecuteScriptAtBlockID, ::Flow::Access::ExecuteScriptAtBlockIDRequest, ::Flow::Access::ExecuteScriptResponse
        # ExecuteScriptAtBlockHeight executes a ready-only Cadence script against the execution state at the given block height.
        rpc :ExecuteScriptAtBlockHeight, ::Flow::Access::ExecuteScriptAtBlockHeightRequest, ::Flow::Access::ExecuteScriptResponse
        # Events
        #
        # GetEventsForHeightRange retrieves events emitted within the specified block range.
        rpc :GetEventsForHeightRange, ::Flow::Access::GetEventsForHeightRangeRequest, ::Flow::Access::EventsResponse
        # GetEventsForBlockIDs retrieves events for the specified block IDs and event type.
        rpc :GetEventsForBlockIDs, ::Flow::Access::GetEventsForBlockIDsRequest, ::Flow::Access::EventsResponse
        # NetworkParameters
        #
        # GetNetworkParameters retrieves the Flow network details
        rpc :GetNetworkParameters, ::Flow::Access::GetNetworkParametersRequest, ::Flow::Access::GetNetworkParametersResponse
        # ProtocolState
        #
        # GetLatestProtocolStateSnapshot retrieves the latest sealed protocol state snapshot.
        # Used by Flow nodes joining the network to bootstrap a space-efficient local state.
        rpc :GetLatestProtocolStateSnapshot, ::Flow::Access::GetLatestProtocolStateSnapshotRequest, ::Flow::Access::ProtocolStateSnapshotResponse
      end

      Stub = Service.rpc_stub_class
    end
  end
end
