class Question < ActiveRecord::Base

  #association
  belongs_to :user
  belongs_to :group
  has_many   :answers, dependent: :destroy
  has_one    :feed_content, as: :content, dependent: :destroy

  #validation
  validates_presence_of :user_id, :text, :group_id

  # find_by は条件にあったものを一件のみ取り出す
  def user_answer(user_id)
    Answer.find_by(user_id: user_id, question_id: id)
  end
end
