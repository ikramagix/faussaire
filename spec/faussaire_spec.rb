# frozen_string_literal: true

RSpec.describe Faussaire do
  before(:each) do
    Faussaire::Name.initialize_data
  end
  it "has a version number" do
    expect(Faussaire::VERSION).not_to be nil
  end
end
