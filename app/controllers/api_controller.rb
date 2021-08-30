class ApiController < ApplicationController
  # -- api to save blog and keyword in database

  # -- ../home/blog 에서 보낸 blog 제목과 내용이 여기서 저장하고 다시 홈화면으로 돌아감
  def post
    @post = Post.new
    @post.title = params[:post_title]
    @post.content = params[:post_content]
    @post.save

    KeywordAnalysisJob.perform_later [@post]

    redirect_to "/home/blog_board"
  end

  # -- ../home/keyword 에서 보낸 키워드가 여기서 저장하고 다시 홈화면으로 돌아감
  def alarm_keyword
    if params[:abc] == "submit"
      @keyword = Keyword.find_by(keyword: params[:alarm_keyword])

      # -- 처음 추가되는 키워드일 경우 --
      if @keyword.blank?
        @keyword = Keyword.new
        @keyword.keyword = params[:alarm_keyword]
        @keyword.user_ids = []
      end

      # -- 키워드를 추가한 유저 중복을 피하기위한 코드 --
      unless @keyword.user_ids.include? params[:user_id].to_i
        @keyword.user_ids << params[:user_id].to_i
        @keyword.save
      end

    else
      @keyword = Keyword.find(params[:keyword_id])
      include_user_id = params[:included_user].to_i

      @keyword.user_ids.delete(include_user_id)
      @keyword.save

      # 해당 키워드를 아무도 추가 안했을 경우 삭제
      if @keyword.user_ids.length == 0
        @keyword.destroy
      end

    end
    redirect_to ""
  end
end
