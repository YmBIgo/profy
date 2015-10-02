class Question < ActiveRecord::Base

  #association
  belongs_to :user
  belongs_to :group
  has_many   :answers, dependent: :destroy
  has_one    :feed_content, as: :content, dependent: :destroy

  #validation
  validates_presence_of :user_id, :text, :group_id

  # call_back
  after_create :create_feed_content

  # find_by は条件にあったものを一件のみ取り出す
  def user_answer(user_id)
    Answer.find_by(user_id: user_id, question_id: id)
  end

  def answered?(user)
    # question.answers.where(user_id: user.id).exists?
    answers.exists?(user_id: user.id)
  end

  private
  def create_feed_content
    self.feed_content = FeedContent.create(group_id: group_id, updated_at: updated_at)
  end
end
