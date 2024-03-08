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
    it "preserves special characters like é & è & ê" do
      cities = Faussaire::Address.instance_variable_get(:@data)['fr']['faussaire']['address']['city']
      special_chars_cities = cities.select { |city| city =~ /[éèê]/ }
      expect(special_chars_cities).not_to be_empty
      special_chars_cities.each do |city|
        expect(city).to match(/[éèê]/)
      end
    end

    # This test ensures an invalid city names like Mont-de-Marsan, Bastille, or Vichy is never returned

    it "does not include invalid city names like Mont-de-Marsan, Bastille, or Vichy" do
        all_cities = Faussaire::Address.send(:data)['fr']['faussaire']['address']['city']
        invalid_cities = ["Mont-de-Marsan", "Bastille", "Vichy"]
        expect(all_cities & invalid_cities).to be_empty
    end
  end
end
