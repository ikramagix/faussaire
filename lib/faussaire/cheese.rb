require 'yaml'

module Faussaire
  class Cheese
    DATA_PATH = File.expand_path('./../../locale/fr.yml', __dir__)

    class << self

        def name
            fetch('fr.faussaire.cheese.name').sample
        end
    end
end
end