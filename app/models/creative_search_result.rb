class CreativeSearchResult
    include ActiveModel::Model
    attr_accessor :user_id, :rank, :schedule_item_id

    def user
      User.find(self.user_id)
    end

    def schedule_item
      if !self.schedule_item_id.nil?
        return ScheduleItem.find(self.schedule_item_id)
      else
        return nil
      end
    end
end

