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
      context 'total_films' do
        let(:projected_films) { Faussaire::Tv.total_films }
        
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
  
      context 'awarded_countries' do
        let(:awarded_countries) { Faussaire::Tv.awarded_countries}

        it 'contains a list of awarded countries' do
          expect(awarded_countries).not_to be_nil
          expect(awarded_countries).to be_an(Array)
          expect(awarded_countries).not_to be_empty
        end
      
        it 'formats entries correctly' do
          awarded_countries.each do |country_entry|
            expect(country_entry).to match(/\A.+ \(total de \d+ récompense(s)?\)$/)
          end
        end
      
        it 'includes correct totals for specific countries' do
          france = awarded_countries.find { |entry| entry.start_with?("France") }
          expect(france).to eq("France (total de 17 récompenses)")
      
          usa = awarded_countries.find { |entry| entry.start_with?("États-Unis") }
          expect(usa).to eq("États-Unis (total de 22 récompenses)")
        end
      
        it 'sorts countries by the number of awards in ascending order' do
          totals = awarded_countries.map do |entry|
            entry.match(/total de (\d+)/)[1].to_i
          end
      
          expect(totals).to eq(totals.sort)
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