require 'rails_helper'

RSpec.describe "teams#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/nba_api/v1/teams",
      params: params
  end

  describe 'basic fetch' do
    let!(:team1) { create(:team) }
    let!(:team2) { create(:team) }

    it 'serializes the list correctly' do
      make_request
      expect(json_ids(true)).to match_array([team1.id, team2.id])
      assert_payload(:team, team1, json_items[0])
      assert_payload(:team, team2, json_items[1])
    end
  end
end
