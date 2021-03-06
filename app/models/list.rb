# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class List < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order ('created_at DESC') }
	has_many :tasks, dependent: :delete_all
end
