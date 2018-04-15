require 'rails_helper'

RSpec.describe "teams#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/nba_api/v1/teams/#{team.id}", payload
  end

  describe 'basic update' do
    let!(:team) { create(:team) }

    let(:payload) do
      {
        data: {
          id: team.id.to_s,
          type: 'teams',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect {
        make_request
      }.to change { team.reload.attributes }
      assert_payload(:team, team, json_item)

      # ... assert updates attributes ...
    end
  end
end
