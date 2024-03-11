# frozen_string_literal: true

require_relative "faussaire/version"
require_relative "faussaire/base"
require_relative "faussaire/name"
require_relative 'faussaire/address'
require_relative 'faussaire/ancien'
require_relative 'faussaire/bizness'
require_relative 'faussaire/tv'


module Faussaire
  class Error < StandardError; end

  # Initialize data for the Faussaire gem
  def self.initialize_data
    Faussaire::Name.initialize_data
    Faussaire::Address.initialize_data
    # Add other modules' initialize_data methods if necessary
  end

  # Convenience method to initialize data for the entire Faussaire gem
  initialize_data
end
