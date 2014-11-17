# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  list_id    :integer
#  goals      :text
#  created_at :datetime
#  updated_at :datetime
#  complete   :boolean
#

class Task < ActiveRecord::Base

  belongs_to :list
end
