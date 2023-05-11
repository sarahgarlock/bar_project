require "rails_helper"

RSpec.describe Keg, type: :model do
  describe "relationship" do
    it { should belong_to :bar }
  end
end