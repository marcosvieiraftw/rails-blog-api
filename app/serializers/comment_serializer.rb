class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :created_at, :updated_at
end
