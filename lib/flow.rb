# frozen_string_literal: true

require_relative "flow/version"
require "flow/access/access_services_pb"
require "flow/execution/execution_services_pb"
require "json"
require "flow/client"

module Flow
  class Error < StandardError; end
end
