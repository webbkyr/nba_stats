require 'rails_helper'

RSpec.describe "teams#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/nba_api/v1/teams", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'teams',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'creates the resource' do
      expect {
        make_request
      }.to change { Team.count }.by(1)
      team = Team.last

      assert_payload(:team, team, json_item)
    end
  end
end
