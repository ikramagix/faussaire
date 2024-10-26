require 'yaml'

module Faussaire
  class Piraterie
    DATA_PATH = File.expand_path('../../../locale/fr.yml', __FILE__)

    ##
    # Fetches and samples data based on the provided key. If the fetched data is an array,
    # it samples a single item, otherwise returns the data directly.
    #
    # @param key [String] The dot-separated key used to access the data.
    # @return [Object, nil] The data fetched and optionally sampled.
    #
    def self.fetch(key)
      data = YAML.load_file(DATA_PATH)
      result = data.dig(*key.split('.'))
      result.is_a?(Array) ? result.sample : result
    end

    ##
    # Produces a random pirate-themed position.
    #
    # @return [String]
    #
    # @example
    #   Faussaire::Piraterie.role #=> "Moussaillon"
    #
    def self.role
      fetch('fr.faussaire.piraterie.role')
    end
  end
end
