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

        describe '.famous_couples' do
          let(:famous_couples) { Faussaire::Bizness.fetch('fr.faussaire.tv.famous_couples') }
      
          it 'returns an array' do
            expect(famous_couples).to be_an(Array)
          end
      
          it 'is not empty' do
            expect(famous_couples).not_to be_empty
          end
      
          it 'contains only strings' do
            expect(famous_couples).to all(be_a(String))
          end
      
          it 'each string contains a year within parentheses' do
            expect(famous_couples).to all(match(/\(\d{4}\)/))
          end
      
          it 'includes "Lauren Bacall et Humphrey Bogart (1950)"' do
            expect(famous_couples).to include("Lauren Bacall et Humphrey Bogart (1950)")
          end
        end      
    end

    describe '.channel' do
      let(:channels) { Faussaire::Tv.fetch('fr.faussaire.tv.channel') }
  
      it 'does not contain "/" in any channel' do
        expect(channels.none? { |channel| channel.include?('/') }).to be true
      end
  
      it 'does not contain sequences like "L1234:5" or any similar format in any entry' do
        expect(channels.none? { |channel| channel.match(/\b[A-Za-z]\d+:\d+\b/) }).to be true
      end
    end
  
  describe '.festival_cannes' do
    let(:festival_cannes) { Faussaire::Tv.festival_cannes }

    context 'total_films' do
      it 'returns the total number of projected films as a string' do
        expect(festival_cannes.total_films).to eq("2062")
      end
    end

    context 'most_represented_countries' do
      it 'returns a string with one of the most represented countries and its film count' do
        country = festival_cannes.most_represented_countries
        expect(country).to match(/\d+ \(.+\)/)
      end
    end

    context 'awarded_countries' do
      it 'returns a string with one of the awarded countries and its award total' do
        country = festival_cannes.awarded_countries
        expect(country).to match(/\A.+ \(total de \d+ récompense(s)?\)$/)
      end
    end

    context 'winners' do
      it 'ends with a year in brackets within the range 1939 to 2023 (10 samples)' do
        10.times do
          winner = festival_cannes.winners 
          expect(winner).to match(/\[(19[3-9]\d|20[0-1]\d|202[0-3])\]$/)
        end
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

        context 'in influencer list' do
          let(:influencers) { Faussaire::Tv.fetch('fr.faussaire.tv.influencer') }
    
          it 'does not contain duplicates' do
            duplicates = influencers.select { |item| influencers.count(item) > 1 }.uniq
            expect(duplicates).to be_empty, "Found duplicates in influencer : #{duplicates.join(', ')}"
          end
        end

        context 'in channel list' do
          let(:channels) { Faussaire::Tv.fetch('fr.faussaire.tv.channel') }
        
          it 'does not contain duplicates' do
            duplicates = channels.select { |item| channels.count(item) > 1 }.uniq
            expect(duplicates).to be_empty, "Found duplicates in channels : #{duplicates.join(', ')}"
          end
        end
    end
end