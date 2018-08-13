require 'rails_helper'

describe "Items API" do
  context "GET /api/v1/items" do
    it "returns a list of items" do
      create_list(:item, 3)

      get "/api/v1/items"

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)
      item = items.first

      expect(items.count).to eq(3)
      expect(item).to have_key(:name)
      expect(item).to have_key(:description)
    end
  end
end
