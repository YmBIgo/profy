class Group < ActiveRecord::Base
  has_many :users
  has_many :questions, ->{ order("created_at DESC") }
end