class TeamsController < ApplicationController
  # Mark this as a JSONAPI controller, associating with the given resource
  jsonapi resource: TeamResource

  # Reference a strong resource payload defined in
  # config/initializers/strong_resources.rb
  strong_resource :team
  # Run strong parameter validation for these actions.
  # Invalid keys will be dropped.
  # Invalid value types will log or raise based on the configuration
  # ActionController::Parameters.action_on_invalid_parameters
  before_action :apply_strong_params, only: [:create, :update]

  # Start with a base scope and pass to render_jsonapi
  def index
    teams = Team.all
    render_jsonapi(teams)
  end

  # Call jsonapi_scope directly here so we can get behavior like
  # sparse fieldsets and statistics.
  def show
    scope = jsonapi_scope(Team.where(id: params[:id]))
    instance = scope.resolve.first
    raise JsonapiCompliable::Errors::RecordNotFound unless instance
    render_jsonapi(instance, scope: false)
  end

  # jsonapi_create will use the configured Resource (and adapter) to persist.
  # This will handle nested relationships as well.
  # On validation errors, render correct error JSON.
  def create
    team, success = jsonapi_create.to_a

    if success
      render_jsonapi(team, scope: false)
    else
      render_errors_for(team)
    end
  end

  # jsonapi_update will use the configured Resource (and adapter) to persist.
  # This will handle nested relationships as well.
  # On validation errors, render correct error JSON.
  def update
    team, success = jsonapi_update.to_a

    if success
      render_jsonapi(team, scope: false)
    else
      render_errors_for(team)
    end
  end

  # Renders 200 OK with empty meta
  # http://jsonapi.org/format/#crud-deleting-responses-200
  def destroy
    team, success = jsonapi_destroy.to_a

    if success
      render json: { meta: {} }
    else
      render_errors_for(team)
    end
  end
end
