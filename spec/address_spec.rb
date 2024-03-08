require 'spec_helper'
require 'faussaire/address'

RSpec.describe Faussaire::Address do
  describe ".city" do
    it "returns a city from the locale file" do
      expect(Faussaire::Address.city).to be_a(String)
      expect(Faussaire::Address.city).not_to be_empty
    end
  end
end
