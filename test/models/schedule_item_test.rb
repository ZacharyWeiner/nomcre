require 'test_helper'

class ScheduleItemTest < ActiveSupport::TestCase
  setup do
    @location = Location.create_default_for_tests
    @creative = User.create!(name: 'Testy McCreative', email: 'testy@mccreative.com', password: 'password', password_confirmation: 'password')
  end

  test "Create A ScheduleItemTest Without a Location" do
    @schedule_item  = ScheduleItem.new
    @schedule_item.start_date = Date.today + 5.days
    @schedule_item.end_date = Date.today + 60.days
    @schedule_item.user = @creative
    @schedule_item.location = nil

    assert_not @schedule_item.save, 'Saved the Schedule Item without a location'

    @location.destroy!
    @creative.destroy!
  end

  test "Create A ScheduleItemTest Without a User" do
    @schedule_item  = ScheduleItem.new
    @schedule_item.start_date = Date.today + 5.days
    @schedule_item.end_date = Date.today + 60.days
    @schedule_item.user = nil
    @schedule_item.location = @location

    assert_not @schedule_item.save, 'Saved the Schedule Item without a User'

    @location.destroy!
    @creative.destroy!
  end

  test "Create A ScheduleItemTest Without a Start Date" do
    @schedule_item  = ScheduleItem.new
    @schedule_item.start_date = nil
    @schedule_item.end_date = Date.today + 60.days
    @schedule_item.user = @creative
    @schedule_item.location = @location

    assert_not @schedule_item.save, 'Saved the Schedule Item without a Start Date'

    @location.destroy!
    @creative.destroy!
  end

  test "Create A ScheduleItemTest Without a End Date" do
    @schedule_item  = ScheduleItem.new
    @schedule_item.start_date = Date.today + 5.days
    @schedule_item.end_date = nil
    @schedule_item.user = @creative
    @schedule_item.location = @location

    assert_not @schedule_item.save, 'Saved the Schedule Item without a End Date'

    @location.destroy!
    @creative.destroy!
  end

  test "Create A ScheduleItemTest With all fields" do
    @schedule_item  = ScheduleItem.new
    @schedule_item.start_date = Date.today + 5.days
    @schedule_item.end_date = Date.today + 60.days
    @schedule_item.user = @creative
    @schedule_item.location = @location

    assert @schedule_item.save, 'Did Not Save the Schedule Item with All Fields'
    @schedule_item.destroy!
    @location.destroy!
    @creative.destroy!
  end

  test "Check ScheduleItems Relationships " do
    @schedule_item  = ScheduleItem.new
    @schedule_item.start_date = Date.today + 5.days
    @schedule_item.end_date = Date.today + 60.days
    @schedule_item.user = @creative
    @schedule_item.location = @location

    assert @schedule_item.save, 'Did Not Save the Schedule Item with All Fields'
    assert_equal @schedule_item.location, @location, 'The locations do no match'
    assert_equal @location.schedule_items.first, @schedule_item, 'The locations do no match'
    assert_equal @schedule_item.user, @creative, 'The users do no match'
    assert_equal @creative.schedule_items.first, @schedule_item, 'The users do no match'

    @schedule_item.destroy!
    @location.destroy!
    @creative.destroy!
  end
end
