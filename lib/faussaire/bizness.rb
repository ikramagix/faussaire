require 'yaml'

module Faussaire
    class Bizness
        DATA_PATH = File.expand_path('../../../locale/fr.yml', __FILE__)

        def self.fetch(key)
            data = YAML.load_file(DATA_PATH)
            data.dig(*key.split('.'))
        end

        def self.brands
            fetch('fr.faussaire.bizness.brands')
        end
    end
end