require 'faussaire/base'
require 'yaml'

module Faussaire
  class Address
    DATA_PATH = File.expand_path('../../locale/fr.yml', __dir__)

    class << self
      def initialize_data
        @data = YAML.load_file(DATA_PATH)
      end

      def city
        key = 'fr.faussaire.address.city'
        fetch(key)
      end

      def street_number_99
        fetch('fr.faussaire.address.street_number_99')
      end

      def street_number_999
        fetch('fr.faussaire.address.street_number_999')
      end

      def street_number_9999
        fetch('fr.faussaire.address.street_number_9999')
      end

      private

      def fetch(key)
        return nil if data.nil? || data.dig(*key.split('.')).nil?
        data.dig(*key.split('.')).sample
      end

      def data
        @data ||= initialize_data
      end
    end
  end
end
