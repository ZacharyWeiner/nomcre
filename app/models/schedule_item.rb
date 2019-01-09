class ScheduleItem < ApplicationRecord
  before_destroy :destroy_related_entities

  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :user
  belongs_to :location


  def destroy_related_entities
    activities = UserActivity.where(user: self.user).where(activity_type: UserActivityType.travel_plan_created).where(object_id: self.id)
     activities.each do |a|
      a.destroy
    end
  end
end
