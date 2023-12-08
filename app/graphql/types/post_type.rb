# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :title, String
    field :content, String
    field :comments, [Types::CommentType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

     # Retrieve post by ID
     field :post, Types::PostType, null: true do
      argument :id, ID, required: true
    end
    def post(id:)
      Post.find_by(id: id)
    end
    def comments
      object.comments
    end

  end
end
