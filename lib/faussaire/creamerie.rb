require 'yaml'

module Faussaire
  class Creamerie
    DATA_PATH = File.expand_path('./../../locale/fr.yml', __dir__)

    class << self

        def name
            fetch('fr.faussaire.creamerie.butter').sample
        end
    end
end
end