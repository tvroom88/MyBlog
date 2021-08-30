class NotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    keyword = args[0][0]
    user_ids = args[0][1]
    blog_id = args[0][2]

    user_ids.each do |user_id|
      @alarm = Alarm.new
      @alarm.user_id = user_id
      @alarm.keyword = keyword
      @alarm.blog_id = blog_id
      @alarm.save
    end
  end
end
