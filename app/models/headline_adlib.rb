class HeadlineAdlib < ApplicationRecord

  def great_result_token
    '#great_result'
  end

  def everyone_action_token
    '#everyone_action'
  end

  def thing_you_hate_token
    '#thing_you_hate'
  end

  def timeframe_token
    '#timeframe'
  end

  def number_token
    '#number'
  end

  def terrible_result_token
    '#terrible_result'
  end

  def group_of_people_token
    '#group_of_people'
  end

  def group_of_people_token
    '#group_of_people'
  end

  def percentage_token
    '#percentage'
  end

  def audience_search_topic_token
    '#audience_search_topic'
  end

  def demographic_token
    '#demographic'
  end

  def common_objection_token
    '#common_objection'
  end

  def personality_type_token
    '#personality_type'
  end

  def unconventional_action_token
    '#unconventional_action'
  end

  def bl_phase_token
    '#bl_phase'
  end

  def strategy_name_token
    '#strategy_name'
  end

  def replace_tokens params

    title = self.title

    unless params[:strategy_name].nil?
      title = title.gsub(self.strategy_name_token, params[:strategy_name])
    end

    unless params[:bl_phase].nil?
      title = title.gsub(self.bl_phase_token, params[:bl_phase])
    end

    unless params[:unconventional_action].nil?
      title = title.gsub(self.unconventional_action_token, params[:unconventional_action])
    end

    unless params[:personality_type].nil?
      title = title.gsub(self.personality_type_token, params[:personality_type])
    end

    unless params[:common_objection].nil?
      title = title.gsub(self.common_objection_token, params[:common_objection])
    end

    unless params[:demographic].nil?
      title = title.gsub(self.demographic_token, params[:demographic])
    end

    unless params[:great_result].nil?
      title = title.gsub(self.great_result_token, params[:great_result])
    end

    unless params[:audience_search_topic].nil?
      title = title.gsub(self.audience_search_topic_token, params[:audience_search_topic])
    end

    unless params[:everyone_action].nil?
      title = title.gsub(self.everyone_action_token, params[:everyone_action])
    end

    unless params[:thing_you_hate].nil?
      title = title.gsub(self.thing_you_hate_token, params[:thing_you_hate])
    end

    unless params[:time_frame].nil?
      title = title.gsub(self.timeframe_token, params[:time_frame])
    end

    unless params[:number].nil?
      title = title.gsub(self.number_token, params[:number])
    end

    unless params[:percentage].nil?
      title = title.gsub(self.percentage_token, params[:percentage])
    end

    unless params[:terrible_result].nil?
      title = title.gsub(self.terrible_result_token, params[:terrible_result])
    end

    unless params[:group_of_people].nil?
      title = title.gsub(self.group_of_people_token, params[:group_of_people])
    end

    title
  end
end
