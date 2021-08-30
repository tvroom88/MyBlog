class HomeController < ApplicationController
  def index
  end

  # -- save blog form --
  def blog
  end

  def blog_board
    @posts = Post.all.order("created_at DESC")
  end

  # -- save keyword form --
  def keyword
  end
end

# -- 모든 게시글 불러오기 --
# @posts = Post.all.order("created_at DESC")
#
# # -- User 모델이 추가 되기전까지 유저가 1명이고 id가 1이라고 가정. --
# @keyword = Keyword.all
#
# # -- 키워드와 게시물 제목에 맞는 alarm 불러옴.
# @alarms = Alarm.all
#
# @alarm_and_blog = []
# @alarms.all.each do |alarm|
#   blog = Post.find(alarm.blog_id)
#   @alarm_and_blog << [alarm, blog]
# end

# -- 검색기능을 위한 Trie 추가 및  키워드 내용 Trie에 넣기 --
# trie = Trie.instance
# Keyword.all.each do |p|
#   trie.insert(p.keyword)
# end