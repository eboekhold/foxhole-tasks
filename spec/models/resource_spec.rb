require 'rails_helper'

RSpec.describe Resource, type: :model do
  describe "#recipes" do
    let(:resource) { FactoryBot.build(:resource) }

    subject { resource.recipes }

    context "when the resource has no recipes" do
      it { is_expected.to eq [] }
    end

    context "when the resource has a recipe it's the input of" do
      let!(:recipe) { FactoryBot.create(:recipe, input_resources_attributes: [{resource: resource, amount: 1}]) }

      it { is_expected.to eq [recipe] }
    end

    context "when the resource has a recipe it's the output of" do
      let!(:recipe) { FactoryBot.create(:recipe, output_resources_attributes: [{resource: resource, amount: 1}]) }

      it { is_expected.to eq [recipe] }
    end

    context "when the resource has a recipe it's the input of and a recipe it's the output of" do
      let!(:input_recipe) { FactoryBot.create(:recipe, input_resources_attributes: [{resource: resource, amount: 1}]) }
      let!(:output_recipe) { FactoryBot.create(:recipe, output_resources_attributes: [{resource: resource, amount: 1} ]) }

      # it { debugger }
      it { is_expected.to include(input_recipe, output_recipe) }
    end
  end
end
