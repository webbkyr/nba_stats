# Serializers define the rendered JSON for a model instance.
# We use jsonapi-rb, which is similar to active_model_serializers.
class SerializableTeam < JSONAPI::Serializable::Resource
  type :teams

  attribute :name
  attribute :city
  attribute :state
  attribute :team_id
  attribute :conference
  
end
