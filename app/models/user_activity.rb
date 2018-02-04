class UserActivity
    include ActiveModel::Model
    attr_accessor :user_id, :activity_type, :activity_item_id, :date, :description

    def user
      User.find(self.user_id)
    end

    def activity_item
      if self.activity_type == 'proposal created'
        return Proposal.find(activity_item_id)
      elsif self.activity_type == 'proposal accepted'
        return Proposal.find(activity_item_id)
      elsif self.activity_type == 'proposal completed'
        return Proposal.find(activity_item_id)
      elsif self.activity_type == 'schedule item added'
        return ScheduleItem.find(activity_item_id)
      elsif self.activity_type == 'collection created'
        return Collection.find(activity_item_id)
      elsif self.activity_type == 'collection updated'
        return Collection.find(activity_item_id)
      end
    end
end


