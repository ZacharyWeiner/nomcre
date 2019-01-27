
zack_admin = User.where(email: 'zack@nomcre.com').first

p "----------- Package Type Modeling Agency 1  ----------"

modeling_agency_1 = PackageType.create!(title: "Modeling Agency 1",
                                 subtitle: "Video Comp Cards for Agency Talent",
                                 description: "Shoot Up To 8 Models for Video Comp Cards in a Single Date.today",
                                 description_image: "",
                                 show_in_menu: false,
                                 menu_link_text: 'Get Those Video Comp Cards',
                                 minimum_images: 25,
                                 minimum_videos: 8,
                                 max_models: 8,
                                 base_price: 5000,
                                 order: 1,
                                 show_on_index: true,
                                 call_to_action_text: "Bring Video Comp Cards To Your Agency Today!",
                                 header_image: HeaderImage.first)


p "----------- Package Type Modeling Agency 1 - Default Project  ----------"
modeling_agency_default_project = Project.create!(package_type_id: modeling_agency_1.id,
                                     company_id: 1,
                                     title: "Modeling Agency - Default Template",
                                     brief: 'Paste your creative brief here, or call us to help create one.',
                                     deadline: Date.today + 60.days,
                                     price: modeling_agency_1.base_price,
                                     is_complete: false,
                                     max_user_shot_list: 25,
                                     is_template: true,
                                     is_default_template: true)


p "----------- Package Type Modeling Agency 1 - Default Video Shoot  ----------"

modeling_agency_shoot_1 = Shoot.create!(project_id: modeling_agency_default_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        title: "Model 1",
                                        content_type: ContentType.video,
                                        brief: modeling_agency_default_project.brief,
                                        price: 250,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: modeling_agency_default_project.deadline,
                                        user_added_shot_count_max: modeling_agency_default_project.max_user_shot_list)


modeling_agency_shoot_2 = Shoot.create!(project_id: modeling_agency_default_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        title: "Model 2",
                                        content_type: ContentType.video,
                                        brief: modeling_agency_default_project.brief,
                                        price: 250,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: modeling_agency_default_project.deadline,
                                        user_added_shot_count_max: modeling_agency_default_project.max_user_shot_list)

modeling_agency_shoot_3 = Shoot.create!(project_id: modeling_agency_default_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        title: "Model 3",
                                        content_type: ContentType.video,
                                        brief: modeling_agency_default_project.brief,
                                        price: 250,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: modeling_agency_default_project.deadline,
                                        user_added_shot_count_max: modeling_agency_default_project.max_user_shot_list)


modeling_agency_shoot_4 = Shoot.create!(project_id: modeling_agency_default_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        title: "Model 4",
                                        content_type: ContentType.video,
                                        brief: modeling_agency_default_project.brief,
                                        price: 250,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: modeling_agency_default_project.deadline,
                                        user_added_shot_count_max: modeling_agency_default_project.max_user_shot_list)


modeling_agency_shoot_5 = Shoot.create!(project_id: modeling_agency_default_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        title: "Model 5",
                                        content_type: ContentType.video,
                                        brief: modeling_agency_default_project.brief,
                                        price: 250,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: modeling_agency_default_project.deadline,
                                        user_added_shot_count_max: modeling_agency_default_project.max_user_shot_list)

modeling_agency_shoot_6 = Shoot.create!(project_id: modeling_agency_default_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        title: "Model 6",
                                        content_type: ContentType.video,
                                        brief: modeling_agency_default_project.brief,
                                        price: 250,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: modeling_agency_default_project.deadline,
                                        user_added_shot_count_max: modeling_agency_default_project.max_user_shot_list)


modeling_agency_shoot_7 = Shoot.create!(project_id: modeling_agency_default_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        title: "Model 7",
                                        content_type: ContentType.video,
                                        brief: modeling_agency_default_project.brief,
                                        price: 250,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: modeling_agency_default_project.deadline,
                                        user_added_shot_count_max: modeling_agency_default_project.max_user_shot_list)

modeling_agency_shoot_8 = Shoot.create!(project_id: modeling_agency_default_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        title: "Model 8",
                                        content_type: ContentType.video,
                                        brief: modeling_agency_default_project.brief,
                                        price: 250,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: modeling_agency_default_project.deadline,
                                        user_added_shot_count_max: modeling_agency_default_project.max_user_shot_list)



modeling_agency_default_project.reload()
modeling_agency_default_project.shoots.each do |shoot|
  excitement_photo = ShotListItem.create!(shoot: shoot,
                                         description: 'Sun (light) shining through person/feture',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                         description: 'Flared out staged imagery',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                         description: 'hero shot of person/feature low angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                         description: 'hero shot of person/feature high angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                         description: 'hero shot of person/feature tight angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                         description: 'hero shot of person/feature wide angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                         description: 'Quick movement spin',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                         description: 'Multiples for motion for overlay/sequence',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                         description: 'Shot with hands up or jumping',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                         description: 'Smile',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                         description: 'Use of reflection on person / feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

 excitement_photo = ShotListItem.create!(shoot: shoot,
                                       description: 'Use of shadow on person / feature',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'photo',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                       description: 'Head turn to camera',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'photo',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                       description: 'Walk into camera',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'photo',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'walk away from camera',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'pan camera move up from legs',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Celebration Solo Panning',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)


  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Celebration Collaborative',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)


  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Celebration Collaborative - wide',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Eyes on feature / person pull back ',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)


  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Straight shot of person/feature focus pull',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Straight shot of person/feature pull back',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Straight shot of person/feature wide',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Straight shot of person/feature mid',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Straight shot of person/feature low',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Straight shot of person/feature tight focus pull',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Angle shot of person/feature focus pull',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Angle shot of person/feature low ',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Angle shot of person/feature mid ',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Angle shot of person/feature high ',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Angle shot of person/feature tight ',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

    excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Establishing shot of person/feature focus pull',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Establishing shot of person/feature low ',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Establishing shot of person/feature mid ',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Establishing shot of person/feature high ',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Establishing shot of person/feature tight ',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Action shot of person/feature mid ',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Action shot of person/feature high ',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)

  excitement_photo = ShotListItem.create!(shoot: shoot,
                                     description: 'Action shot of person/feature tight ',
                                     aspect_ratio: 'portrait',
                                     background: "From brief",
                                     item_type: 'photo',
                                     focus_point: 'Best Practices',
                                     shoot_location: "On Set",
                                     added_by_id: zack_admin.id)


 end





