require "rails_helper"

RSpec.describe TodoEntriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/todo_entries").to route_to("todo_entries#index")
    end

    it "routes to #new" do
      expect(get: "/todo_entries/new").to route_to("todo_entries#new")
    end

    it "routes to #show" do
      expect(get: "/todo_entries/1").to route_to("todo_entries#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/todo_entries/1/edit").to route_to("todo_entries#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/todo_entries").to route_to("todo_entries#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/todo_entries/1").to route_to("todo_entries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/todo_entries/1").to route_to("todo_entries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/todo_entries/1").to route_to("todo_entries#destroy", id: "1")
    end
  end
end
