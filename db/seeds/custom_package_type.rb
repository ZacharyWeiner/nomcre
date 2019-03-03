custom_package = PackageType.create!(title: "Custom",
                                 subtitle: "Create A Custom Package!",
                                 description: "Create your own combination of photo and video shoots",
                                 description_image: "www.nomcre.com/excitement_description image",
                                 show_in_menu: false,
                                 menu_link_text: 'Custom Packages!',
                                 minimum_images: 0,
                                 minimum_videos: 0,
                                 max_models: 2,
                                 base_price: 1,
                                 order: 9,
                                 show_on_index: true,
                                 add_default_shot_list: true,
                                 call_to_action_text: "Create your Custom Package Now!",
                                 header_image: HeaderImage.first)



custom_default_project = Project.create!(package_type_id: custom_package.id,
                                     company_id: 1,
                                     title: "Custom Package - Default Template",
                                     brief: 'Paste your creative brief here, or call us to help create one.',
                                     deadline: Date.today + 60.days,
                                     price: custom_package.base_price,
                                     is_complete: false,
                                     max_user_shot_list: 50,
                                     is_template: true,
                                     is_default_template: true)
