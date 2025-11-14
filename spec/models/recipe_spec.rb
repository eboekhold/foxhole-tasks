require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "#time_formatted" do
    let(:recipe) { FactoryBot.build(:recipe, time: time) }

    let(:subject) { recipe.time_formatted }

    context "if the time is 1 ms" do
      let(:time) { 1 }

      it { is_expected.to eq "00:00:00.001"} 
    end

    context "if the time is 1 second" do
      let(:time) { 1000 }

      it { is_expected.to eq "00:00:01" }
    end

    context "if the time is 1 minute" do
      let(:time) { 1000 * 60 }

      it { is_expected.to eq "00:01:00" }
    end

    context "if the time is 90 seconds" do
      let(:time) { 1000 * 90 }

      it { is_expected.to eq "00:01:30" }
    end
  end
end
