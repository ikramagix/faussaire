require 'yaml'

module Faussaire
  class Gardinerie
    DATA_PATH = File.expand_path('./../../locale/fr.yml', __dir__)

    class << self
      ##
      # Produces a random vegetable name and its ideal consumption month in France.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Gardinerie.vegetable #=> "Carotte (Mars)"
      #
      def vegetable
        fetch('fr.faussaire.gardinerie.potager').sample
      end

      ##
      # Produces a random fruit name and its ideal consumption month in France.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Gardinerie.fruit #=> "Pomme (Janvier)"
      #
      def fruit
        fetch('fr.faussaire.gardinerie.verger').sample
      end

      ##
      # Produces a random name of a harmful weed (harmful for agriculture).
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Gardinerie.rival_plant #=> "Cuscuta campestris de la famille des Convolvulaceae, parasite sur diverses plantes cultivées, notamment les Fabaceae, répartition cosmopolite"
      #
      def rival_plant
        fetch('fr.faussaire.gardinerie.rival_plant').sample
      end

      ##
      # Produces a random name of a carnivorous plant.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Gardinerie.bang_bang_plant #=> "Drosera : pièges à mucilage avec feuilles et poils qui s'enroulent autour des proies"
      #
      def bang_bang_plant
        fetch('fr.faussaire.gardinerie.bang_bang_plant').sample
      end

      ##
      # Produces a random psychotropic plant name.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Gardinerie.very_naughty_plant #=> "Cannabis sativa ssp. indica : Chanvre, source de substances psychotropes de la famille des Cannabaceae"
      #
      def very_naughty_plant
        fetch('fr.faussaire.gardinerie.very_naughty_plant').sample
      end

      private

      def fetch(key)
        data = YAML.load_file(DATA_PATH)
        data.dig(*key.split('.'))
      end
    end
  end
end
