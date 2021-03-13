# frozen_string_literal: true

module Flow
  class Client
    MAINNET_URL = "access.mainnet.nodes.onflow.org:9000"
    TESTNEST_URL = "access.devnet.nodes.onflow.org:9000"
    CANARYNET_URL = "access.canary.nodes.onflow.org:9000"

    def initialize(node_address = MAINNET_URL)
      @stub = Access::AccessAPI::Stub.new(node_address, :this_channel_is_insecure)
    end

    def ping
      @stub.ping(Access::PingRequest.new)
    end

    #### Block Headers
    ## The following methods query information about block headers.

    ## GetLatestBlockHeader
    # GetLatestBlockHeader gets the latest sealed or unsealed block header.

    def get_latest_block_header(is_sealed = false)
      req = Access::GetLatestBlockHeaderRequest.new(is_sealed: is_sealed)
      @stub.get_latest_block_header(req)
    end

    ## GetBlockHeaderByID
    # GetBlockHeaderByID gets a block header by ID.

    def get_block_header_by_id(id)
      # to_bytes if its not bytes
      req = Access::GetBlockHeaderByIDRequest.new(id: id)
      @stub.get_block_header_by_id(req)
    end

    ## GetBlockHeaderByHeight
    # GetBlockHeaderByHeight gets a block header by height.

    def get_block_header_by_height(height)
      req = Access::GetBlockHeaderByHeightRequest.new(height: height)
      @stub.get_block_header_by_height(req)
    end

    #### Blocks
    ## The following methods query information about full blocks.

    ## GetLatestBlock
    # GetLatestBlock gets the full payload of the latest sealed or unsealed block.

    def get_latest_block(is_sealed = false)
      req = Access::GetLatestBlockRequest.new(is_sealed: is_sealed)
      @stub.get_latest_block(req)
    end

    ## GetBlockByID
    # GetBlockByID gets a full block by ID.

    def get_block_by_id(id)
      # to_bytes if its not bytes
      req = Access::GetBlockByIDRequest.new(id: id)
      @stub.get_block_by_id(req)
    end

    ## GetBlockByHeight
    # GetBlockByHeight gets a full block by height.

    def get_block_by_height(height)
      req = Access::GetBlockByHeightRequest.new(height: height)
      @stub.get_block_by_height(req)
    end

    #### Collections
    ## The following methods query information about collections.

    ## GetCollectionByID
    # GetCollectionByID gets a collection by ID.

    def get_collection_by_id(id)
      # to_bytes if its not bytes
      req = Access::GetCollectionByIDRequest.new(id: id)
      @stub.get_collection_by_id(req)
    end

    #### Transactions
    ## The following methods can be used to submit transactions and fetch their results.

    ## SendTransaction
    # SendTransaction submits a transaction to the network.

    def send_transaction()
      # TODO: build transaction here
      # req = Access::SendTransactionRequest.new()
      # @stub.send_transaction(req)
    end

    ## GetTransaction
    # GetTransaction gets a transaction by ID.

    def get_transaction(id)
      # to_bytes if its not bytes
      req = Access::GetTransactionRequest.new(id: id)
      @stub.get_transaction(req)
    end

    ## GetTransactionResult
    # GetTransactionResult gets the execution result of a transaction.

    def get_transaction_result(id)
      # to_bytes if its not bytes
      req = Access::GetTransactionRequest.new(id: id)
      @stub.get_transaction_result(req)
    end

    #### Accounts

    ## GetAccountAtLatestBlock
    # GetAccountAtLatestBlock gets an account by address.

    def get_account_at_latest_block(address)
      # to_bytes(address)
      req = Access::GetAccountAtLatestBlockRequest.new(address: address)
      @stub.get_account_at_latest_block(req)
      # res.account
    end

    # def execute_script(script, args = [])
    #   req = Access::ExecuteScriptAtLatestBlockRequest.new(script: script, arguments: args)
    #   res = @stub.execute_script_at_latest_block(req)
    #   parse_json(res.value)
    # end

    private

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
