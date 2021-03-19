# frozen_string_literal: true

module Flow
  #
  # The client class is used to access the Flow API
  #
  class Client
    NODES = {
      mainnet: "access.mainnet.nodes.onflow.org:9000",
      testnet: "access.devnet.nodes.onflow.org:9000",
      canarynet: "access.canary.nodes.onflow.org:9000"
    }.freeze

    #
    # @param node [Symbol, String] the node address used in the stub
    #
    def initialize(node: :mainnet)
      @stub = Access::AccessAPI::Stub.new(detect_node(node), :this_channel_is_insecure)
    end

    #
    # Check if the Access API is ready and available
    #
    # @return [Flow::Access::PingResponse]
    #
    def ping
      @stub.ping(Access::PingRequest.new)
    end

    ####
    # Block Headers
    #
    # The following methods query information about block headers
    ####

    #
    # Get the latest sealed or unsealed block header
    #
    # @param is_sealed [Boolean]
    #
    # @return [Flow::Entities::BlockHeader]
    #
    def get_latest_block_header(is_sealed: false)
      req = Access::GetLatestBlockHeaderRequest.new(is_sealed: is_sealed)
      res = @stub.get_latest_block_header(req)
      res.block
    end

    #
    # Get a block header by ID
    #
    # @todo The ID should be +bytes+ or it should be formatted automatically
    #
    # @param id [String]
    #
    # @return [Flow::Entities::BlockHeader]
    #
    def get_block_header_by_id(id)
      req = Access::GetBlockHeaderByIDRequest.new(id: id)
      res = @stub.get_block_header_by_id(req)
      res.block
    end

    #
    # Get a block header by height
    #
    # @param height [uint64]
    #
    # @return [Flow::Entities::BlockHeader]
    #
    def get_block_header_by_height(height)
      req = Access::GetBlockHeaderByHeightRequest.new(height: height)
      res = @stub.get_block_header_by_height(req)
      res.block
    end

    ####
    # Blocks
    #
    # The following methods query information about full blocks
    ####

    #
    # Get the full payload of the latest sealed or unsealed block
    #
    # @param is_sealed [Boolean]
    #
    # @return [Flow::Entities::Block]
    #
    def get_latest_block(is_sealed: false)
      req = Access::GetLatestBlockRequest.new(is_sealed: is_sealed)
      res = @stub.get_latest_block(req)
      res.block
    end

    #
    # Get a full block by ID
    #
    # @todo The ID should be +bytes+ or it should be formatted automatically
    #
    # @param id [String]
    #
    # @return [Flow::Entities::Block]
    #
    def get_block_by_id(id)
      req = Access::GetBlockByIDRequest.new(id: id)
      res = @stub.get_block_by_id(req)
      res.block
    end

    #
    # Get a full block by height
    #
    # @param height [uint64]
    #
    # @return [Flow::Entities::Block]
    #
    def get_block_by_height(height)
      req = Access::GetBlockByHeightRequest.new(height: height)
      res = @stub.get_block_by_height(req)
      res.block
    end

    ####
    # Collections
    #
    # The following methods query information about collections
    ####

    #
    # Gets a collection by ID
    #
    # @todo The ID should be +bytes+ or it should be formatted automatically
    #
    # @param id [String]
    #
    # @return [Flow::Entities::Collection]
    #
    def get_collection_by_id(id)
      req = Access::GetCollectionByIDRequest.new(id: id)
      res = @stub.get_collection_by_id(req)
      res.collection
    end

    ####
    # Transactions
    #
    # The following methods can be used to submit transactions and fetch their results
    ####

    #
    # Submit a transaction to the network
    #
    #
    #
    #
    # def send_transaction()
    #   # TODO: build transaction here
    #   # req = Access::SendTransactionRequest.new()
    #   # @stub.send_transaction(req)
    # end

    #
    # Get a transaction by ID
    #
    # @todo The ID should be +bytes+ or it should be formatted automatically
    #
    # @param id [String]
    #
    # @return [Flow::Entities::Transaction]
    #
    def get_transaction(id)
      req = Access::GetTransactionRequest.new(id: id)
      res = @stub.get_transaction(req)
      res.transaction
    end

    #
    # Get the execution result of a transaction
    #
    # @todo The ID should be +bytes+ or it should be formatted automatically
    # @todo We might want to change the return value here, TransactionReturnResponse has
    #   these available keys: status, status_code, error_message, events
    #
    # @param id [String]
    #
    # @return [Flow::Access::TransactionResultResponse]
    #
    def get_transaction_result(id)
      req = Access::GetTransactionRequest.new(id: id)
      @stub.get_transaction_result(req)
    end

    ####
    # Accounts
    ####

    #
    # Get an account by address
    #
    # @param address [String]
    #
    # @return [Flow::Entities::Account]
    #
    def get_account_at_latest_block(address)
      req = Access::GetAccountAtLatestBlockRequest.new(address: to_bytes(address))
      res = @stub.get_account_at_latest_block(req)
      res.account
    end

    #
    # Get an account by address at the given block height
    #
    # @param address [String]
    # @param block_height [uint64]
    #
    # @return [Flow::Entities::Account]
    #
    def get_account_at_block_height(address, block_height)
      req = Access::GetAccountAtBlockHeightRequest.new(address: to_bytes(address), block_height: block_height)
      res = @stub.get_account_at_latest_block(req)
      res.account
    end

    ####
    # Scripts
    ####

    #
    # Execute a read-only Cadence script against the latest sealed execution state
    #
    # @param script [String] cadence script
    # @param args [Array] array of args
    #
    # @return [OpenStruct]
    #
    def execute_script(script, args = [])
      req = Access::ExecuteScriptAtLatestBlockRequest.new(
        script: script,
        arguments: args
      )

      res = @stub.execute_script_at_latest_block(req)
      parse_json(res.value)
    end

    ####
    # Events
    #
    # The following methods can be used to query for on-chain events
    ####

    #
    # Retrieve events emitted within the specified block range
    #
    # @param type [String]
    # @param start_height [uint64]
    # @param end_height [uint64]
    #
    # @return []
    #
    # def get_events_for_height_range(type, start_height: 2, end_height: 3)
    #   req = Access::GetEventsForHeightRangeRequest.new(type: type, start_height: start_height, end_height: end_height)
    #   res = @stub.get_events_for_height_range(req)
    #   res
    # end

    ####
    # Network Parameters
    #
    # Network parameters provide information about the Flow network.
    #   Currently, it only includes the chain ID.
    #   The following method can be used to query for network parameters
    ####

    #
    # Retrieve the network parameters
    #
    # @return [Hash]
    #
    def get_network_parameters
      req = Access::GetNetworkParametersRequest.new
      res = @stub.get_network_parameters(req)
      res.to_h
    end

    ####
    # Protocol state snapshot
    #
    # The following method can be used to query the latest protocol state snapshot
    ####

    #
    # Retrieve the latest Protocol state snapshot serialized as a byte array.
    #   It is used by Flow nodes joining the network to bootstrap a space-efficient local state
    #
    # @todo Fix. This currently fails with unimplemented_error
    #
    # @return
    #
    def get_latest_protocol_state_snapshot
      req = Access::GetLatestProtocolStateSnapshotRequest.new
      @stub.get_latest_protocol_state_snapshot(req)
    end

    private

    def detect_node(node)
      case node.to_sym
      when :mainnet   then NODES[:mainnet]
      when :testnet   then NODES[:testnet]
      when :canarynet then NODES[:canarynet]
      else                 node
      end
    end

    def parse_json(event_payload)
      JSON.parse(event_payload, object_class: OpenStruct)
    end

    def to_bytes(string)
      [string].pack("H*")
    end

    def to_string(bytes)
      bytes.unpack1("H*")
    end
  end
end
