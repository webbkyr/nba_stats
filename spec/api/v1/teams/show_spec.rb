require 'rails_helper'

RSpec.describe "teams#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/nba_api/v1/teams/#{team.id}",
      params: params
  end

  describe 'basic fetch' do
    let!(:team) { create(:team) }

    it 'serializes the resource correctly' do
      make_request
      assert_payload(:team, team, json_item)
    end
  end
end
