require 'yaml'

module Faussaire
    class Citation
        DATA_PATH = File.expand_path('./../../locale/fr.yml', __dir__)
          
        class << self
            ##
            # Produces a random philosopher quote.
            #
            # @return [String]
            #
            # @example
            #   Faussaire::Citation.philo #=> "Homère a dit un jour : Le sommeil et la mort sont des frères jumeaux."
            #
            def philo
                fetch('fr.faussaire.citation.philosophy').sample
            end

            ##
            # Produces a random french proverb.
            #
            # @return [String]
            #
            # @example
            #   Faussaire::Citation.proverbe #=> "Pense deux fois avant de parler, tu en parleras deux fois mieux."
            #
            def proverbe
                fetch('fr.faussaire.citation.proverbe').sample
            end

            private

            def fetch(key)
            data = YAML.load_file(DATA_PATH)
            data.dig(*key.split('.'))
            end
        end  
    end
end