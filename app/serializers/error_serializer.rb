class ErrorSerializer
  include JSONAPI::Serializer

  attributes :code, :message
end
