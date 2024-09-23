require 'yaml'

module Faussaire
  class Address
    DATA_PATH = File.expand_path('../../locale/fr.yml', __dir__)

    class << self
      def initialize_data
        @data = YAML.load_file(DATA_PATH)
      end

      ##
      # Produces a random city name.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Address.city #=> "Paris"
      #
      def city
        fetch('fr.faussaire.address.city')
      end

      ##
      # Produces a random street number up to 99.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Address.street_number_99 #=> "42"
      #
      def street_number_99
        fetch('fr.faussaire.address.street_number_99')
      end

      ##
      # Produces a random street number up to 999.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Address.street_number_999 #=> "123"
      #
      def street_number_999
        fetch('fr.faussaire.address.street_number_999')
      end

      ##
      # Produces a random street number up to 9999.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Address.street_number_9999 #=> "1234"
      #
      def street_number_9999
        fetch('fr.faussaire.address.street_number_9999')
      end

      ##
      # Produces a random street type.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Address.street_type #=> "Avenue"
      #
      def street_type
        fetch('fr.faussaire.address.street_type')
      end

      ##
      # Produces a random street name.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Address.street_name #=> "Champs-Élysées"
      #
      def street_name
        fetch('fr.faussaire.address.street_name')
      end

      ##
      # Produces a random department name.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Address.dpt_name #=> "Yvelines"
      #
      def dpt_name
        fetch('fr.faussaire.address.dpt_name')
      end

      ##
      # Produces a random department number for metropolitan France.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Address.dpt_number #=> "78"
      #
      def dpt_number
        fetch('fr.faussaire.address.dpt_number_metropolis')
      end

      ##
      # Produces a random department number for overseas departments.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Address.dpt_number_other #=> "971"
      #
      def dpt_number_other
        fetch('fr.faussaire.address.dpt_number_overseas')
      end

      ##
      # Produces a random postal code, formatted to five digits.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Address.postal_code #=> "75001"
      #
      def postal_code
        code = fetch('fr.faussaire.address.postal_code')
        code.to_s.rjust(5, '0')
      end

      ##
      # Produces a random region name.
      #
      # @return [String]
      #
      # @example
      #   Faussaire::Address.region #=> "Île-de-France"
      #
      def region
        fetch('fr.faussaire.address.region')
      end

      ##
      # Generates a complete address using various components such as street number,
      # street type, street name, postal code, city, and region.
      #
      # @return [String] The full address in a standard format.
      #
      # @example
      #   Faussaire::Address.full_address #=> "3 Rue du Bac, 75007 Paris, Tarn (44), Région Nouvelle-Aquitaine"
      #
      def full_address
        number = random_street_number
        type = street_type
        name = street_name
        postal = postal_code
        city_name = city
        department_name = dpt_name
        department_number = department_number_select
        reg = region


        "#{number} #{type} #{name}, #{postal} #{city_name}, #{department_name} (#{department_number}), Région #{reg}"
      end

      private

      def random_street_number
        [
          method(:street_number_99),
          method(:street_number_999),
          method(:street_number_9999)
        ].sample.call
      end

      def department_number_select
        [dpt_number, dpt_number_other].sample
      end

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
