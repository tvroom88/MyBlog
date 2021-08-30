class Keyword < ActiveRecord::Base
  serialize :user_ids, Array

  # keyword에 작성되는 내용에 있어 동일한 내용(중복) 금지
  validates_uniqueness_of :keyword
end
