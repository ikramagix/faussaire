require 'yaml'

module Faussaire
  class Wine
    DATA_PATH = File.expand_path('./../../locale/fr.yml', __dir__)

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
        fetch('fr.faussaire.wine.name').sample
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
        fetch('fr.faussaire.wine.type').sample
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
        fetch('fr.faussaire.wine.bottle_types').sample
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
        fetch('fr.faussaire.wine.region').sample
      end

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
        case random_number
        when 0...0.5
          euros = rand(3.5..499).floor
        when 0.5...0.85
          euros = rand(500..2999).floor
        when 0.85...0.95
          euros = rand(3000..301300).floor
        else
          euros = rand(301301..482000).floor
        end

        "#{euros}.99€"
      end

      def licocorico
        fetch('fr.faussaire.wine.licocorico').sample
      end

      private

      def fetch(key)
        data = YAML.load_file(DATA_PATH)
        data.dig(*key.split('.'))
      end
    end
  end
end
