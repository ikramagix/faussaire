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

    let(:words) { Faussaire::Ancien.fetch('fr.faussaire.ancien.words') }

    describe '.words' do

      it 'fetches words list' do
        expect(words).not_to be_nil
        expect(words).to be_an(Array)
      end

    it 'does not contain the character *' do
      words_with_character = words.select { |word| word.include?('*') }
      expect(words_with_character).to be_empty, "Words containing the character '*': #{words_with_character.join(', ')}"
    end

    it 'does not start with a number followed by a period' do
      words_with_number = words.select { |word| word.match?(/^\d+\./) }
      expect(words_with_number).to be_empty, "Words starting with a number followed by a period: #{words_with_number.join(', ')}"
    end

    it 'does not contain (se)' do
      words_with_se = words.select { |word| word.include?('(se)') }
      expect(words_with_se).to be_empty, "Words containing '(se)': #{words_with_se.join(', ')}"
    end
  end

  describe '.no duplicates' do
    context 'in creatures list' do
      let(:creatures) { Faussaire::Ancien.fetch('fr.faussaire.ancien.creature') }

      it 'does not contain duplicates' do
        duplicates = creatures.select { |item| creatures.count(item) > 1 }.uniq
        expect(duplicates).to be_empty, "Found duplicates in creatures: #{duplicates.join(', ')}"
      end
    end

    context 'in historical figures list' do
      let(:historical_figures) { Faussaire::Ancien.fetch('fr.faussaire.ancien.historical_figure') }

      it 'does not contain duplicates' do
        duplicates = historical_figures.select { |item| historical_figures.count(item) > 1 }.uniq
        expect(duplicates).to be_empty, "Found duplicates in historical figures: #{duplicates.join(', ')}"
      end
    end

    context 'in words list' do
      let(:words) { Faussaire::Ancien.fetch('fr.faussaire.ancien.words') }

      it 'does not contain duplicates' do
        duplicates = words.select { |word| words.count(word) > 1 }.uniq
        expect(duplicates).to be_empty, "Found duplicates in words: #{duplicates.join(', ')}"
      end
    end
  end
end