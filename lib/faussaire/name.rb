require 'yaml'

module Faussaire
  class Name
    DATA_PATH = File.expand_path('../../locale/fr.yml', __dir__)

    class << self
      ##
      # Initializes the data from the YAML file.
      #
      def initialize_data
        @data = YAML.load_file(DATA_PATH)
      end

      ##
      # Produces a random female first name.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Name.female_first_name #=> "Marie"
      #
      def female_first_name
        key = 'fr.faussaire.name.female_first_name'
        fetch(key)
      end

      ##
      # Produces a random male first name.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Name.male_first_name #=> "Jean"
      #
      def male_first_name
        key = 'fr.faussaire.name.male_first_name'
        fetch(key)
      end

      ##
      # Produces a random family name.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Name.family_name #=> "Dupont"
      #
      def family_name
        key = 'fr.faussaire.name.family_name'
        fetch(key)
      end

      ##
      # Generates a full name by combining a random first name (either male or female) with a family name.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Name.name #=> "Marie Dupont"
      #
      def name
        first_name = [female_first_name, male_first_name].sample
        [first_name, family_name].join(' ')
      end

      private

      ##
      # Fetches and samples data based on the provided key.
      # If the fetched data is an array, it samples a single item,
      # otherwise returns the data directly.
      #
      # @param key [String] The dot-separated key used to access the data.
      # @return [Object, nil] The data fetched and optionally sampled.
      #
      def fetch(key)
        return nil if data.nil? || data.dig(*key.split('.')).nil?
        data.dig(*key.split('.')).sample
      end

      ##
      # Accessor for the data loaded from the YAML file.
      # Ensures data is loaded only once and reused across method calls.
      #
      # @return [Hash]
      #
      def data
        @data ||= initialize_data
      end
    end
  end
end
