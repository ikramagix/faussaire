require 'yaml'

module Faussaire
  class Creamerie
    DATA_PATH = File.expand_path('../../locale/fr.yml', __dir__)

    class << self
      ##
      # Produces a random milk type.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Creamerie.milk_type #=> "de vache"
      def milk_type
        fetch('fr.faussaire.creamerie.milk_type')
      end

      ##
      # Produces a random butter.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Creamerie.butter #=> "Beurre Charentes-Poitou"
      def butter
        fetch('fr.faussaire.creamerie.butter')
      end

      ##
      # Produces a random cream.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Creamerie.cream #=> "Crème d'Isigny"
      def cream
        fetch('fr.faussaire.creamerie.cream')
      end

      ##
      # Produces a random cheese.
      #
      # @return [Hash]
      #
      # @example
      #   Faussaire::Creamerie.cheese #=> { type: ..., name: ..., region: ... }
      def cheese
        {
          type: fetch('fr.faussaire.creamerie.cheese.type'),
          name: fetch('fr.faussaire.creamerie.cheese.name'),
          region: fetch('fr.faussaire.creamerie.cheese.region')
        }
      end

      private

      def fetch(key)
        data = YAML.load_file(DATA_PATH)
        data.dig(*key.split('.')).sample
      end

      def cheese_type
        fetch('creamerie.cheese.type')
      end

      def cheese_name
        fetch('creamerie.cheese.name')
      end

      def cheese_region
        fetch('creamerie.cheese.region')
      end
    end
  end
end
