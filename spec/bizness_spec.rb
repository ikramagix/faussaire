require 'faussaire/bizness'

RSpec.describe Faussaire::Bizness do
    describe '.brands' do
        let(:brands) { Faussaire::Bizness.fetch('fr.faussaire.bizness.brands') }

        it 'returns an array' do
            expect(brands).to be_an(Array)
        end
      
        it 'contains the correct number of brands' do
            expected_number_of_brands = 500
            expect(brands.size).to eq(expected_number_of_brands)
        end
      
        it 'contains only non-empty strings' do
            expect(brands).to all(be_a(String).and satisfy { |brand| !brand.empty? })
        end

        it 'has brands encoded in UTF-8' do
            expect(brands).to all(satisfy { |brand| brand.encoding.name == "UTF-8" && brand.valid_encoding? })
        end
    end

    describe '.no duplicates' do
        context 'in brands list' do
          let(:brands) { Faussaire::Bizness.fetch('fr.faussaire.bizness.brands') }
    
          it 'does not contain duplicates' do
            duplicates = brands.select { |item| brands.count(item) > 1 }.uniq
            expect(duplicates).to be_empty, "Found duplicates in brands : #{duplicates.join(', ')}"
          end
        end
    end
end