# frozen_string_literal: true

require "spec_helper"
require "yaml"
require "faussaire/name"

RSpec.describe Faussaire::Name do
  let(:fr_name_data) { YAML.load_file(described_class::DATA_PATHS[:fr]).dig("fr", "faussaire", "name") }
  let(:el_name_data) { YAML.load_file(described_class::DATA_PATHS[:el]).dig("el", "faussaire", "name") }

  before do
    described_class.locale = :fr
  end

  after do
    described_class.locale = :fr
  end

  describe ".available_locales" do
    it "includes French and Greek locales" do
      expect(described_class.available_locales).to include(:fr, :el)
    end
  end

  describe "when using French locale" do
    it "returns a female first name from French data" do
      expect(fr_name_data["female_first_name"]).to include(described_class.female_first_name)
    end

    it "returns a male first name from French data" do
      expect(fr_name_data["male_first_name"]).to include(described_class.male_first_name)
    end

    it "returns a family name from French data" do
      expect(fr_name_data["family_name"]).to include(described_class.family_name)
    end

    it "returns a full name string" do
      full_name = described_class.name
      expect(full_name).to be_a(String)
      expect(full_name).to include(" ")
    end
  end

  describe "when using Greek locale" do
    before do
      described_class.locale = :el
    end

    it "returns a female first name from Greek data" do
      expect(el_name_data["female_first_name"]).to include(described_class.female_first_name)
    end

    it "returns a male first name from Greek data" do
      expect(el_name_data["male_first_name"]).to include(described_class.male_first_name)
    end

    it "returns a family name from Greek data" do
      expect(el_name_data["family_name"]).to include(described_class.family_name)
    end

    it "returns a full name string" do
      full_name = described_class.name
      expect(full_name).to be_a(String)
      expect(full_name).to include(" ")
    end
  end

  describe ".locale=" do
    it "falls back to French if locale is unknown" do
      described_class.locale = :xx
      expect(described_class.locale).to eq(:fr)
      expect(fr_name_data["female_first_name"]).to include(described_class.female_first_name)
    end
  end
end
