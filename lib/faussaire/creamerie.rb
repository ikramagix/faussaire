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
      # @return [Hash]
      #
      # @example
      #   Faussaire::Creamerie.butter #=> { name: ..., type: ... }
      def butter
        {
          name: fetch('fr.faussaire.creamerie.butter.name'),
          type: fetch('fr.faussaire.creamerie.butter.type')
        }
      end
      
      ##
      # Produces information about top butter producers.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Creamerie.butter_producers #=> "N°1: États-Unis (892,801 t)"
      def butter_producers
        fetch('fr.faussaire.creamerie.butter.top_producers')
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
