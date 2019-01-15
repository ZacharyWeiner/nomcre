require 'test_helper'
class PackageTypeTest < ActiveSupport::TestCase
  setup do
    @header_image = HeaderImage.create!();
  end

  test "Create A Package Type Without a Title" do
    package_type = PackageType.new(subtitle: 'Something',
                                   description: 'Something',
                                   minimum_images: 1,
                                   minimum_videos:1,
                                   max_models: 1,
                                   base_price: 1000,
                                   header_image: @header_image)
    assert_not package_type.save, "Saved the package type without a title"
    @header_image.destroy!
  end

  test "Create A Package Type Without a Subtitle" do
   package_type = PackageType.new(title: 'Something',
                                   description: 'Something',
                                   minimum_images: 1,
                                   minimum_videos:1,
                                   max_models: 1,
                                  base_price: 1000,
                                   header_image: @header_image)
    assert_not package_type.save, "Saved the package type without a subtitle"
    @header_image.destroy!
  end

  test "Create A Package Type Without a description" do
   package_type = PackageType.new(title: 'Something',
                                   subtitle: 'Something',
                                   minimum_images: 1,
                                   minimum_videos:1,
                                   max_models: 1,
                                   base_price: 1000,
                                   header_image: @header_image)
    assert_not package_type.save, "Saved the package type without a subtitle"
    @header_image.destroy!
  end

  test "Create A Package Type Without a minimum_images" do
   package_type = PackageType.new(title: 'Something',
                                   subtitle: "Something",
                                   description: 'Something',
                                   minimum_videos:1,
                                   max_models: 1,
                                   base_price: 1000,
                                   header_image: @header_image)
    assert_not package_type.save, "Saved the package type without a minimum_images"
    @header_image.destroy!
  end

  test "Create A Package Type Without a minimum_videos" do
   package_type = PackageType.new(title: 'Something',
                                   subtitle: "Something",
                                   description: 'Something',
                                   minimum_images:1,
                                   max_models: 1,
                                   base_price: 1000,
                                   header_image: @header_image)
    assert_not package_type.save, "Saved the package type without a minimum_images"
    @header_image.destroy!
  end

  test "Create A Package Type Without a max_models" do
   package_type = PackageType.new(title: 'Something',
                                   subtitle: "Something",
                                   description: 'Something',
                                   minimum_images:1,
                                   minimum_videos:1,
                                   base_price: 1000,
                                   header_image: @header_image)
    assert_not package_type.save, "Saved the package type without a minimum_videos"
    @header_image.destroy!
  end

   test "Create A Package Type Without a base_price" do
   package_type = PackageType.new(title: 'Something',
                                   subtitle: "Something",
                                   description: 'Something',
                                   minimum_images:1,
                                   minimum_videos:1,
                                   max_models: 10,
                                   header_image: @header_image)
    assert_not package_type.save, "Saved the package type without a base_price"
    @header_image.destroy!
  end

   test "Create A Package Type With all validated fields" do
   package_type = PackageType.new(title: 'Something',
                                   subtitle: "Something",
                                   description: 'Something',
                                   minimum_images:1,
                                   minimum_videos:1,
                                   max_models: 1,
                                   base_price: 1000,
                                   header_image: @header_image)
    assert package_type.save, "Saved the package type with all required fields"
    package_type.destroy!
    @header_image.destroy!
  end

  test 'Attach a Project as template' do
    @company  = Company.create_default_for_tests
     @package_type = PackageType.create_default_for_tests
     @project = Project.create_default_for_tests @package_type.id, @company.id
     @project.is_template = true
     @project.save!

     @default = @package_type.default_template
     assert_equal false, @default.nil?, 'default template should be returned'
  end

  test 'Attach a Project as a default template' do
     @company  = Company.create_default_for_tests
     @package_type = PackageType.create_default_for_tests
     @project = Project.create_default_for_tests @package_type.id, @company.id
     @project.is_default_template = true
     @project.save!

     @project2 = Project.create_default_for_tests @package_type.id, @company.id
     @project2.is_template  = true
     @project2.save!

     @default = @package_type.default_template
     assert_equal @project, @default, 'default template should be returned'
  end

  test 'Model::Method create_project' do
     @company  = Company.create_default_for_tests
     @package_type = PackageType.create_default_for_tests
     @project = Project.create_default_for_tests @package_type.id, @company.id
     @project.is_default_template = true
     @project.save!

     @new_project = @package_type.create_project @company.users.first, Date.today + 60.days

     assert_not @new_project.nil?, 'the new project should not be nil'
     assert_not_equal @project, @new_project, 'this should create a new project not reference the exisitng'
  end
end
