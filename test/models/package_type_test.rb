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
    assert false;
  end

  test 'Attach a Project as a default template' do
    assert false;
  end

  test 'Model::Method create_project' do
    assert false;
  end
end
