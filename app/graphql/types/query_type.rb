# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject

    #get all the users
    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    #get user by id
    field :user, Types::UserType, null: true do
      description "Get a user by ID"
      argument :id, ID, required: true
    end

    def user(id:)
      User.find_by(id: id)
    end

    #get all posts
    field :posts, [Types::PostType], null: false
    def posts
      Post.all
    end

    #get post by id
    field :post, Types::PostType, null: true do
      argument :id, ID, required: true
    end
    def post(id:)
      Post.find_by(id: id)
    end

  end
end
