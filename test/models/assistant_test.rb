require 'test_helper'

class AssistantTest < ActiveSupport::TestCase
  setup do
    @package_type = PackageType.create_default_for_tests
    @company = Company.create_default_for_tests
    @project = Project.create_default_for_tests @package_type.id, @company.id
    @location = Location.create_default_for_tests
    @shoot = Shoot.create_default_for_tests(@project.id, @company.id, @location.id)
  end
  test "Create An Assistant Without a Name" do
    @assistant = Assistant.new()
    @assistant.name = nil
    @assistant.paypal_email = 'Testy@gmail.com'
    @assistant.phone = '19650009988'
    @assistant.rate = 100
    @assistant.assistant_type = AssistantType.general
    @assistant.location = @location
    @assistant.facebook = 'www.facebook.com'
    @assistant.instagram = '@instagram'
    @assistant.notes = 'Tesster Notes'
    @assistant.shoot = @shoot

    assert_not @assistant.save, "Saved the assistant without a name"

    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
  end

  test "Create An Assistant Without a paypal_email" do
    @assistant = Assistant.new()
    @assistant.name = "Testy Mc Testers - Assistant"
    @assistant.paypal_email = nil
    @assistant.phone = '19650009988'
    @assistant.rate = 100
    @assistant.assistant_type = AssistantType.general
    @assistant.location = @location
    @assistant.facebook = 'www.facebook.com'
    @assistant.instagram = '@instagram'
    @assistant.notes = 'Assistant Notes'
    @assistant.shoot = @shoot

    assert_not @assistant.save, "Saved the assistant without a name"

    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
  end

  test "Create An Assistant Without a Phone Number" do
    @assistant = Assistant.new()
    @assistant.name = "Testy Mc Testers - Assistant"
    @assistant.paypal_email = 'Testy-assistant@gmail.com'
    @assistant.phone = nil
    @assistant.rate = 100
    @assistant.assistant_type = AssistantType.general
    @assistant.location = @location
    @assistant.facebook = 'www.facebook.com'
    @assistant.instagram = '@instagram'
    @assistant.notes = 'Assistant Notes'
    @assistant.shoot = @shoot

    assert_not @assistant.save, "Saved the assistant without a name"

    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
  end
  test "Create An Assistant Without a rate" do
    @assistant = Assistant.new()
    @assistant.name = "Testy Mc Testers - Assistant"
    @assistant.paypal_email = 'Testy-assistant@gmail.com'
    @assistant.phone = '19650009988'
    @assistant.rate = nil
    @assistant.assistant_type = AssistantType.general
    @assistant.location = @location
    @assistant.facebook = 'www.facebook.com'
    @assistant.instagram = '@instagram'
    @assistant.notes = 'Assistant Notes'
    @assistant.shoot = @shoot

    assert_not @assistant.save, "Saved the assistant without a name"

    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
  end

  test "Create An Assistant Without a Asssitant Type" do
    @assistant = Assistant.new()
    @assistant.name = "Testy Mc Testers - Assistant"
    @assistant.paypal_email = 'Testy-assistant@gmail.com'
    @assistant.phone = '19650009988'
    @assistant.rate = 100
    @assistant.assistant_type = nil
    @assistant.location = @location
    @assistant.facebook = 'www.facebook.com'
    @assistant.instagram = '@instagram'
    @assistant.notes = 'Assistant Notes'
    @assistant.shoot = @shoot

    assert_not @assistant.save, "Saved the assistant without a name"

    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
  end

  test "Create An Assistant Without a Location" do
    @assistant = Assistant.new()
    @assistant.name = "Testy Mc Testers - Assistant"
    @assistant.paypal_email = 'Testy-assistant@gmail.com'
    @assistant.phone = '19650009988'
    @assistant.rate = 100
    @assistant.assistant_type = AssistantType.general
    @assistant.location = nil
    @assistant.facebook = 'www.facebook.com'
    @assistant.instagram = '@instagram'
    @assistant.notes = 'Assistant Notes'
    @assistant.shoot = @shoot

    assert_not @assistant.save, "Saved the assistant without a name"

    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
  end

  test "Create An Assistant With all fields" do
    @assistant = Assistant.new()
    @assistant.name = "Testy Mc Testers - Assistant"
    @assistant.paypal_email = 'Testy-assistant@gmail.com'
    @assistant.phone = '19650009988'
    @assistant.rate = 100
    @assistant.assistant_type = AssistantType.general
    @assistant.location = @location
    @assistant.facebook = 'www.facebook.com'
    @assistant.instagram = '@instagram'
    @assistant.notes = 'Assistant Notes'
    @assistant.shoot = @shoot

    assert @assistant.save, "Saved the assistant without a name"

    @assistant.destroy!
    @shoot.destroy!
    @project.destroy!
    @company.destroy!
    @location.destroy!
  end
end
