class TopController < ApplicationController

  def index
    @question = Question.new
    # @questions = current_user.group.questions
    # content を include することでパフォーマンスの低下を避ける
    @feed_contents = current_user.group.feed_contents.includes(:content).page(params[:page]).per(5)
    @feed_contents_resource = @feed_contents.map(&:content)
  end

end
