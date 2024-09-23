require 'yaml'

module Faussaire
  class Cosmos
    DATA_PATH = File.expand_path('../../locale/fr.yml', __dir__)

    class << self
      def initialize_data
        @data = YAML.load_file(DATA_PATH)
      end

      ##
      # Produces a random planet name.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Cosmos.planet #=> "Mars"
      #
      def planet
        fetch('fr.faussaire.cosmos.planet')
      end

      ##
      # Produces a random cosmic event.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Cosmos.event #=> "Éclipse solaire"
      #
      def event
        fetch('fr.faussaire.cosmos.event')
      end

      ##
      # Produces a random neighborhood in the cosmos (like a galaxy or nebula).
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Cosmos.neighborhood #=> "Voie lactée"
      #
      def neighborhood
        fetch('fr.faussaire.cosmos.neighborhood')
      end

      ##
      # Produces a random space exploration name.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Cosmos.exploration #=> "Voyager"
      #
      def exploration
        fetch('fr.faussaire.cosmos.exploration')
      end

      private

      def fetch(key)
        return nil if data.nil? || data.dig(*key.split('.')).nil?
        data.dig(*key.split('.')).sample
      end

      def data
        @data ||= initialize_data
      end
    end
  end
end
