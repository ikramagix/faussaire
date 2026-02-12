# frozen_string_literal: true

require "yaml"

module Faussaire
  ##
  # Generates randomized first and family names for supported locales.
  #
  class Name
    DATA_PATHS = {
      fr: File.expand_path("../../locale/fr.yml", __dir__),
      el: File.expand_path("../../locale/el.yml", __dir__)
    }.freeze
    DEFAULT_LOCALE = :fr
    DATA_PATH = DATA_PATHS[DEFAULT_LOCALE]

    class << self
      ##
      # Initializes locale-specific data from the YAML file.
      #
      # @param locale [Symbol, String] The locale to load.
      #
      def initialize_data(locale = DEFAULT_LOCALE)
        candidate_locale = normalize_locale(locale)
        @locale = DATA_PATHS.key?(candidate_locale) ? candidate_locale : DEFAULT_LOCALE
        @data = YAML.load_file(DATA_PATHS[@locale])
      end

      ##
      # Returns all available locales for this module.
      #
      # @return [Array<Symbol>]
      #
      def available_locales
        DATA_PATHS.keys
      end

      ##
      # Returns the active locale.
      #
      # @return [Symbol]
      #
      def locale
        @locale || DEFAULT_LOCALE
      end

      ##
      # Sets the active locale and reloads data accordingly.
      #
      # @param locale [Symbol, String]
      #
      def locale=(locale)
        initialize_data(locale)
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
        key = "#{locale}.faussaire.name.female_first_name"
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
        key = "#{locale}.faussaire.name.male_first_name"
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
        key = "#{locale}.faussaire.name.family_name"
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
        [first_name, family_name].join(" ")
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
        return nil if data.nil? || data.dig(*key.split(".")).nil?

        data.dig(*key.split(".")).sample
      end

      ##
      # Accessor for the data loaded from the YAML file.
      # Ensures data is loaded only once and reused across method calls.
      #
      # @return [Hash]
      #
      def data
        @data ||= initialize_data(locale)
      end

      ##
      # Normalizes locale input to an internal symbol representation.
      #
      # @param locale [Symbol, String]
      # @return [Symbol]
      #
      def normalize_locale(locale)
        locale.to_s.strip.downcase.to_sym
      end
    end
  end
end
