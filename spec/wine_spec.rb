require 'spec_helper'
require 'faussaire/wine'

RSpec.describe Faussaire::Wine do
    describe ".type" do
        # This test ensures that the method returns a string and is not empty
        it "returns a wine type from the locale file" do
          expect(Faussaire::Wine.type).to be_a(String)
          expect(Faussaire::Address.type).not_to be_empty
        end
    end
end
