class Post
  include Mongoid::Document
  field :user_id, type: Integer
  field :title, type: String
  field :content_text, type: String

  belongs_to :user
end