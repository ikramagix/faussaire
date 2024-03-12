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
  
      it 'does not contain "VM3372:5" in any channel' do
        expect(channels.none? { |channel| channel.include?('VM3372:5') }).to be true
      end
  
      it 'does not contain "Anciennes chaînes :" in any channel' do
        expect(channels.none? { |channel| channel.include?('Anciennes chaînes :') }).to be true
      end
    end

    describe '.festival_cannes' do
      context 'projected_films' do
        let(:projected_films) { Faussaire::Tv.projected_films }
        
        it 'returns the total number of projected films as a string' do
          expect(projected_films).to eq("2062")
        end
      end
  
      context 'most_represented_countries' do
        let(:most_represented_countries) { Faussaire::Tv.most_represented_countries }
  
        it 'returns a list of strings with country names and their film counts' do
          expected_countries = [
            "376 (États-Unis)",
            "348 (France)",
            "183 (Italie)",
            "161 (Royaume-Uni)",
            "80 (Allemagne)"
          ]
          expect(most_represented_countries).to match_array(expected_countries)
        end
      end
  
      context 'palms_by_country' do
        let(:palms_by_country) { Faussaire::Tv.palms_by_country }
  
        it 'returns a list of strings with country names and their Palme d’Or counts' do
          expected_palms = [
            "16 (États-Unis)",
            "9 (Italie)",
            "8 (France)",
            "7 (Royaume-Uni)",
            "3 (Japon)",
            "3 (Danemark)"
          ]
          expect(palms_by_country).to match_array(expected_palms)
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