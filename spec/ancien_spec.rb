require 'faussaire/ancien'

RSpec.describe Faussaire::Ancien do
    describe '.creature' do
      let(:creatures) { Faussaire::Ancien.fetch('fr.faussaire.ancien.creature') }
      let(:creature) { Faussaire::Ancien.creature }
  
      it 'returns a string' do
        expect(creature).to be_a(String)
      end
  
      it 'returns a valid creature from the YAML list' do
        expect(creatures).to include(creature), "Expected creatures to include #{creature.inspect}, but it did not. Available creatures: #{creatures.inspect}"
      end
    end

    describe '.historical_figure' do
        let(:historical_figures) { Faussaire::Ancien.fetch('fr.faussaire.ancien.historical_figure') }
        let(:historical_figure) { Faussaire::Ancien.historical_figure }
    
        it 'returns a string' do
          expect(historical_figure).to be_a(String)
        end
    
        it 'returns a valid historical figure from the YAML list' do
          expect(historical_figures).to include(historical_figure)
        end

        it 'includes figures with the special character ’' do
          special_character_figures = historical_figures.select { |figure| figure.include?("’") }
          expect(special_character_figures).not_to be_empty
          special_character_figures.each do |figure|
            expect(figure).to include("’"), "Expected '#{figure}' to include the special character ’"
          end
        end
    end
end
  