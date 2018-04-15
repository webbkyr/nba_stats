require 'jsonapi_swagger_helpers'

class DocsController < ActionController::API
  include JsonapiSwaggerHelpers::DocsControllerMixin

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'NBA Data'
      key :description, '--'
      contact do
        key :name, 'Kayla R. Webb'
        key :email, 'kaylarwebb@gmail.com'
      end
    end
    key :basePath, '/nba_api'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end
end
