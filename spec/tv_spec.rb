require 'faussaire/tv'

RSpec.describe Faussaire::Tv do
    describe '.shows' do
        let(:shows) { Array.new(56) { Faussaire::Tv.show } }
    
        it 'returns a string' do
          expect(Faussaire::Tv.show).to be_a(String)
        end
    
        it 'returns a non-empty string' do
          expect(Faussaire::Tv.show).not_to be_empty
        end
    
        it 'has shows encoded in UTF-8' do
          expect(Faussaire::Tv.show.encoding.name).to eq("UTF-8")
          expect(Faussaire::Tv.show.valid_encoding?).to be(true)
        end
    
        context '.randomness when called multiple times' do
            let(:sample_shows) { Array.new(56) { Faussaire::Tv.show } } 
            
            it 'returns unique shows indicating randomness' do
              unique_shows = sample_shows.uniq
              expect(unique_shows.size).to be > 1
            end
      
            it 'has a high proportion of unique shows' do
              unique_shows = sample_shows.uniq
              expect(unique_shows.size).to be > (0.5 * 56).to_i, "Expected more than half of the shows to be unique"
            end
          end
    end

    describe '.no duplicate values' do
        context 'in shows list' do
          let(:shows) { Faussaire::Tv.fetch('fr.faussaire.tv.show') }
    
          it 'does not contain duplicates' do
            duplicates = shows.select { |item| shows.count(item) > 1 }.uniq
            expect(duplicates).to be_empty, "Found duplicates in shows : #{duplicates.join(', ')}"
          end
        end
    end
end