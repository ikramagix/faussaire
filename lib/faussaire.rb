# frozen_string_literal: true

require_relative "faussaire/version"
require_relative "faussaire/base"
require_relative "faussaire/name"

module Faussaire
  class Error < StandardError; end

  # Initialize data for the Faussaire gem
  def self.initialize_data
    Faussaire::Name.initialize_data
    # Add other modules' initialize_data methods if necessary
  end

  # Convenience method to initialize data for the entire Faussaire gem
  initialize_data
end
