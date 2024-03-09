require 'faussaire/base'
require 'yaml'

module Faussaire
  class Name
    DATA_PATH = File.expand_path('../../locale/fr.yml', __dir__)

    class << self
      def initialize_data
        @data = YAML.load_file(DATA_PATH)
      end

      def female_first_name
        key = 'fr.faussaire.name.female_first_name'
        fetch(key)
      end

      def male_first_name
        key = 'fr.faussaire.name.male_first_name'
        fetch(key)
      end

      def family_name
        key = 'fr.faussaire.name.family_name'
        fetch(key)
      end

      def name
        first_name = [female_first_name, male_first_name].sample
        [first_name, family_name].join(' ')
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
