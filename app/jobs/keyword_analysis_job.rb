class KeywordAnalysisJob < ApplicationJob
  queue_as :default

  def perform(*args)
    trie = Trie.instance

    post = args[0][0]
    title_words = post.title.split
    content_words = post.content.split
    key_global_set = Set.new

    title_words.each do |word|
      key_set = trie.search(word)
      key_global_set = key_global_set.merge key_set
    end

    content_words.each do |word|
      key_set = trie.search(word)
      key_global_set = key_global_set.merge key_set
    end

    # find real keyword from database & collect User
    key_global_set.each do |key_title|
      # user_ids_array = Keyword.where(:keyword => key_title)[0].user_ids
      user_ids_array = Keyword.where({keyword: key_title})[0].user_ids
      NotificationJob.perform_later [key_title, user_ids_array, post.id]
    end
  end
end
