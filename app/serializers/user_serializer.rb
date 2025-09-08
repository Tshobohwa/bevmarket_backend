class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :current_establishment_id, :is_employed
end
