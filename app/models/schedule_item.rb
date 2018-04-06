class ScheduleItem < ApplicationRecord
  belongs_to :user
  belongs_to :location
  before_destroy :destroy_related_entities

  def destroy_related_entities
    byebug
    activities = UserActivity.where(user: self.user).where(activity_type: UserActivityType.travel_plan_created).where(object_id: self.id)
     activities.each do |a|
      a.destroy
    end
  end
end
