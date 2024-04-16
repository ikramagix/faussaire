require 'yaml'

module Faussaire
  class Ancien
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
    # Produces a random mythical creature name.
    #
    # @return [String]
    #
    # @example
    #   Faussaire::Ancien.creature #=> "Dragon"
    #
    def self.creature
      fetch('fr.faussaire.ancien.creature')
    end

    ##
    # Produces a random historic figure name.
    #
    # @return [String]
    #
    # @example
    #   Faussaire::Ancien.historic_figure #=> "Napoléon Bonaparte"
    #
    def self.historic_figure
      fetch('fr.faussaire.ancien.historic_figure')
    end

    ##
    # Retrieves a random word.
    #
    # @return [String]
    #
    # @example
    #   Faussaire::Ancien.words #=> "liberté"
    #
    def self.words
      fetch('fr.faussaire.ancien.words')
    end
  end
end
