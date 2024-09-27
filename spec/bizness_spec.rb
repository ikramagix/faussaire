require 'faussaire/bizness'

RSpec.describe Faussaire::Bizness do
  describe '.brands' do
    let(:brand) { Faussaire::Bizness.brands }

    it 'returns a string' do
      expect(brand).to be_a(String)
    end

    it 'is a non-empty string' do
      expect(brand).not_to be_empty
    end

    it 'is encoded in UTF-8' do
      expect(brand.encoding.name).to eq("UTF-8")
      expect(brand.valid_encoding?).to be true
    end
  end

    describe '.no duplicates' do
      context 'in brands list' do
        # Load the full array from the YAML for the purpose of this test
        let(:all_brands) { YAML.load_file(Faussaire::Bizness::DATA_PATH).dig('fr', 'faussaire', 'bizness', 'brands') }
  
        it 'does not contain duplicates' do
          duplicates = all_brands.select { |item| all_brands.count(item) > 1 }.uniq
          expect(duplicates).to be_empty, "Found duplicates in brands: #{duplicates.join(', ')}"
        end
      end

        context 'in pipotronics list' do
            let(:pipotronics) { Faussaire::Bizness.load_dico.flatten }
        
            it 'does not contain duplicates' do
              duplicates = pipotronics.select { |item| pipotronics.count(item) > 1 }.uniq
              expect(duplicates).to be_empty, "Found duplicates in pipotronics: #{duplicates.join(', ')}"
            end
          end
    end

    describe '.pipotronic' do
        # Tester si la méthode retourne une chaîne de caractères
        it 'returns a string' do
          expect(Faussaire::Bizness.pipotronic).to be_a(String)
        end
        
        # Tester si la chaîne retournée se termine par un point
        it 'ends with a period' do
          expect(Faussaire::Bizness.pipotronic).to end_with('.')
        end
    
        # Tester si la chaîne contient au moins un espace, suggérant la présence de plusieurs mots
        it 'contains spaces indicating multiple words' do
          expect(Faussaire::Bizness.pipotronic).to include(' ')
        end
    
        # Tester si la chaîne ne contient pas de marqueurs temporaires non remplacés comme '#'
        it 'does not contain placeholder markers like #' do
          expect(Faussaire::Bizness.pipotronic).not_to include('#')
        end
        
        # Tester si la chaîne est encodée en UTF-8 et ne contient pas d'encodage invalide
        it 'is encoded in UTF-8 and contains valid encoding' do
          sentence = Faussaire::Bizness.pipotronic
          expect(sentence.encoding.name).to eq("UTF-8")
          expect(sentence.valid_encoding?).to be true
        end

        let(:pipotronic_phrase) { Faussaire::Bizness.pipotronic }

        it 'should not contain grammatical errors' do
          expect(pipotronic_phrase).to_not match(/(\bd'|d'\b|\ben |en\b)/)
        end
    end
end