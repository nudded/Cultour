# == Schema Information
#
# Table name: clubs
#
#  id            :integer          not null, primary key
#  full_name     :string(255)
#  internal_name :string(255)
#  display_name  :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Club < ActiveRecord::Base

  has_many :events

  has_and_belongs_to_many :users
  # enrolled_members, not admins
  has_and_belongs_to_many :members, join_table: :enrolled_clubs_members, class_name: 'User'

  validates :internal_name, uniqueness: true

  def name
    full_name ? full_name : display_name
  end
end
