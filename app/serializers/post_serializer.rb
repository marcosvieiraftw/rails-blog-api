class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :created_at, :updated_at
  belongs_to :user
end
