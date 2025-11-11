require "rails_helper"

RSpec.describe StructuresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/structures").to route_to("structures#index")
    end

    it "routes to #new" do
      expect(get: "/structures/new").to route_to("structures#new")
    end

    it "routes to #show" do
      expect(get: "/structures/1").to route_to("structures#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/structures/1/edit").to route_to("structures#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/structures").to route_to("structures#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/structures/1").to route_to("structures#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/structures/1").to route_to("structures#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/structures/1").to route_to("structures#destroy", id: "1")
    end
  end
end
