require 'yaml'

module Faussaire
  class Wine
    DATA_PATH = File.expand_path('../../locale/fr.yml', __dir__)

    class << self
      ##
      # Produces a random wine name.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Wine.name #=> "Chateau Margaux"
      #
      def name
        fetch('fr.faussaire.wine.name')
      end

      ##
      # Produces a random wine type or style.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Wine.type #=> "Red Wine"
      #
      def type
        fetch('fr.faussaire.wine.type')
      end

      ##
      # Produces a random wine bottle type.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Wine.bottle_type #=> "Cabernet Sauvignon"
      #
      def bottle_type
        fetch('fr.faussaire.wine.bottle_types')
      end

      ##
      # Produces a random wine region.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Wine.region #=> "Bordeaux"
      #
      def region
        fetch('fr.faussaire.wine.region')
      end

      ##
      # Produces a random wine price with 99 cents and a Euro (€) symbol.
      # Distribution:
      # - 50% chance for a price between 3.5 and 499 (Low range)
      # - 35% chance for a price between 499 and 2999 (Middle range)
      # - 10% chance for a price between 3000 and 301300 (Upper-High range)
      # - 15% chance for a price between 301301 and 482000 (Legendary range)
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Wine.price #=> "39.99€"
      #
      def price
        random_number = rand
        euros = case random_number
                when 0...0.5 then rand(3.5..499).floor
                when 0.5...0.85 then rand(500..2999).floor
                when 0.85...0.95 then rand(3000..301300).floor
                else rand(301301..482000).floor
                end
        "#{euros}.99€"
      end

      ##
      # Produces a random wine feature called "Licocorico".
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Wine.licocorico #=> "Licocorico Special Blend"
      #
      def licocorico
        fetch('fr.faussaire.wine.licocorico')
      end

      private

      ##
      # Fetches and samples data from the YAML file based on the provided key.
      # If the data is an array, it samples a single item.
      #
      # @param key [String] The dot-separated key used to access the data.
      # @return [Object, nil] The data fetched and optionally sampled.
      #
      def fetch(key)
        data = YAML.load_file(DATA_PATH)
        result = data.dig(*key.split('.'))
        result.is_a?(Array) ? result.sample : result
      end
    end
  end
end
