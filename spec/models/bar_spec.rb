require "rails_helper"

RSpec.describe Bar, type: :model do
  describe "relationship" do
    it { should have_many :kegs }
  end
end