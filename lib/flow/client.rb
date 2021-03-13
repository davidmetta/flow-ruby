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

    # def get_account(address)
    #   req = Access::GetAccountAtLatestBlockRequest.new(address: to_bytes(address))
    #   res = @stub.get_account_at_latest_block(req)
    #   res.account
    # end

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
