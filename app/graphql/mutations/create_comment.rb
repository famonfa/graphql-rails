class Mutations::CreateComment < Mutations::BaseMutation
  argument :body , String, required: true
  argument :user_id, ID, required: true
  argument :post_id, ID, required: true

  field :post, Types::PostType, null: false
  field :comment, Types::CommentType, null: false
  field :errors, [String], null: false

  def resolve(body:, user_id:, post_id:)
    comment = Comment.create!(body: body, user_id: user_id, post_id: post_id)

    if comment.save
      {
        comment: comment,
        errors: [],
      }
    else
      {
        comment: nil,
        errors: comment.errors.full_messages
      }
    end

  end
end
