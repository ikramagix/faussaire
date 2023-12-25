require 'faussaire/base'
require 'yaml'

module Faussaire
  class Name
    DATA_PATH = File.expand_path('../../locale/fr.yml', __dir__)

    class << self
      def initialize_data
        @data = YAML.load_file(DATA_PATH)
        #puts "Loaded data: #{@data.inspect}"
      end

      def female_first_name
        key = 'fr.faussaire.name.female_first_name'
        #puts "Fetching key: #{key}"
        fetch(key)
      end

      def male_first_name
        key = 'fr.faussaire.name.male_first_name'
        #puts "Fetching key: #{key}"
        fetch(key)
      end

      def family_name
        key = 'fr.faussaire.name.family_name'
        #puts "Fetching key: #{key}"
        fetch(key)
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
