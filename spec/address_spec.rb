require 'spec_helper'
require 'faussaire/address'

RSpec.describe Faussaire::Address do
  describe ".city" do
    # This test ensures that the method returns a string and is not empty
    it "returns a city from the locale file" do
      expect(Faussaire::Address.city).to be_a(String)
      expect(Faussaire::Address.city).not_to be_empty
    end

    # This test checks that the city contains only valid UTF-8 characters
    it "returns a city with valid UTF-8 characters" do
        city = Faussaire::Address.city
        expect(city).to be_a(String)
        expect(city.encode('UTF-8')).to be_valid_encoding
    end

    # This test ensures that cities with special characters are not altered
    it "preserves special characters like letters with accents or hyphens" do
      cities = Faussaire::Address.instance_variable_get(:@data)['fr']['faussaire']['address']['city']
      special_chars_cities = cities.select { |city| city =~ /[àâäéèêëîïôöùûüÿç-]/ }
      expect(special_chars_cities).not_to be_empty
      special_chars_cities.each do |city|
        expect(city).to match(/[àâäéèêëîïôöùûüÿç-]/)
      end
    end

    # This test ensures an invalid city names like Mont-de-Marsan, Bastille, or Vichy is never returned

    it "does not include invalid city names or names ending with a space" do
      all_cities = Faussaire::Address.send(:data)['fr']['faussaire']['address']['city']
      invalid_cities = ["Mont-de-Marsan", "Bastille", "Vichy"]
    
      # This test ensures that a city name never end with a space
      cities_with_trailing_space = all_cities.select { |city| city.match(/ $/) }
    
      expect(all_cities & invalid_cities).to be_empty, "Invalid city names were found: #{(all_cities & invalid_cities).join(', ')}"
      expect(cities_with_trailing_space).to be_empty, "City names with trailing spaces were found: #{cities_with_trailing_space.join(', ')}"
    end
  end

  describe ".street_number" do
    it "street_number_99 returns a number between 1 and 99, never 0 or a number with more than 2 digits" do
      number = Faussaire::Address.street_number_99.to_i
      expect(number).to be_between(1, 99)
    end

    it "street_number_999 does not have duplicate values" do
      numbers = Faussaire::Address.send(:data)['fr']['faussaire']['address']['street_number_999']
      duplicates = numbers.group_by { |number| number }
                          .select { |_, occurrences| occurrences.size > 1 }
                          .keys
      expect(numbers.uniq.size).to eq(numbers.size), "Duplicates were found: #{duplicates.join(', ')}"
  end  

    it "street_number_9999 does not have duplicate values" do
      numbers = Faussaire::Address.send(:data)['fr']['faussaire']['address']['street_number_9999']
      duplicates = numbers.group_by { |number| number }
                          .select { |_, occurrences| occurrences.size > 1 }
                          .keys
      expect(numbers.uniq.size).to eq(numbers.size), "Duplicates were found: #{duplicates.join(', ')}"    
    end
  end

  describe ".dpt_number" do
    it "is represented as a two-digit string and falls between '01' and '95'" do
      dpt_numbers = Faussaire::Address.send(:data)['fr']['faussaire']['address']['dpt_number_metropolis'].map { |num| num.to_s.rjust(2, '0') }
      invalid_values = dpt_numbers.select { |num_str| !(num_str =~ /\A\d{2}\z/) || num_str.to_i < 1 || num_str.to_i > 95 }
  
      expect(invalid_values).to be_empty, "Found invalid department numbers: #{invalid_values.join(', ')}"
    end
  end
  
    it "dpt_number_other is three digits and matches one of the specified overseas values" do
      valid_overseas_dpt_numbers = [971, 972, 973, 974, 976]
      dpt_numbers_other = Faussaire::Address.send(:data)['fr']['faussaire']['address']['dpt_number_overseas']
      invalid_values = dpt_numbers_other.select { |num| !valid_overseas_dpt_numbers.include?(num.to_i) }
  
      expect(invalid_values).to be_empty, "Invalid overseas department numbers found: #{invalid_values.join(', ')}"
    end

  describe ".dpt_name" do
      before(:all) do
        @dpt_names = Faussaire::Address.send(:data)['fr']['faussaire']['address']['dpt_name']
      end
    
      it "contains only strings" do
        expect(@dpt_names).to all(be_a(String))
      end
    
      it "contains no nil values" do
        expect(@dpt_names).not_to include(nil, ' ')
      end
    
      it "has the correct number of department names" do
        expect(@dpt_names.count).to eq(101)
      end
    
      it "has no duplicates" do
        expect(@dpt_names.uniq.count).to eq(@dpt_names.count)
      end
    
      it "has valid department names" do
        dpt_names = Faussaire::Address.send(:data)['fr']['faussaire']['address']['dpt_name']
        valid_format_regex = /\A[\p{L}'\-]+(?:[\s\-'][\p{L}'\-]+)*\z/
      
        invalid_names = dpt_names.select { |name| name !~ valid_format_regex }
        expect(invalid_names).to be_empty, "Invalid department names found: #{invalid_names.join(', ')}"
      end

    describe ".postal_code" do
      it "returns a string of exactly five digits" do
        postal_code = Faussaire::Address.postal_code
          
        expect(postal_code).to be_a(String)
        expect(postal_code.length).to eq(5)
        expect(postal_code).to match(/\A\d{5}\z/)
      end
    end
  end
end
