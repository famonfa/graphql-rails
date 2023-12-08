class Mutations::CreatePost < Mutations::BaseMutation
  argument :title , String, required: true
  argument :comment, String, required: true
  argument :user_id, ID, required: true

  field :post, Types::PostType, null: false
  field :errors, [String], null: false

  def resolve(title:, comment:, user_id:)
    post = Post.create!(title: title, content: comment, user_id: user_id)
    if post.save
      {
        post: post,
        errors: [],
      }
    else
      {
        post: nil,
        errors: post.errors.full_messages
      }
    end

  end
end
