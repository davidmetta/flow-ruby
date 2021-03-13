# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: flow/entities/block.proto

require 'google/protobuf'

require 'google/protobuf/timestamp_pb'
require 'flow/entities/collection_pb'
require 'flow/entities/block_seal_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("flow/entities/block.proto", :syntax => :proto3) do
    add_message "flow.entities.Block" do
      optional :id, :bytes, 1
      optional :parent_id, :bytes, 2
      optional :height, :uint64, 3
      optional :timestamp, :message, 4, "google.protobuf.Timestamp"
      repeated :collection_guarantees, :message, 5, "flow.entities.CollectionGuarantee"
      repeated :block_seals, :message, 6, "flow.entities.BlockSeal"
      repeated :signatures, :bytes, 7
    end
  end
end

module Flow
  module Entities
    Block = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("flow.entities.Block").msgclass
  end
end
