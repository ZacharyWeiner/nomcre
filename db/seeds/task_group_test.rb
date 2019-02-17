#task_group Package
zack_admin = User.where(email: 'zack@nomcre.com').first

p "----------- Package Type task_group ----------"

task_group = PackageType.create!(title: "task_group",
                                 subtitle: "We Create Hype!",
                                 description: "Creating task_group for a product, person, buidling, service or business",
                                 description_image: "www.nomcre.com/task_group_description image",
                                 show_in_menu: true,
                                 menu_link_text: 'Hype Up Your Audience!',
                                 minimum_images: 365,
                                 minimum_videos: 40,
                                 max_models: 2,
                                 base_price: 12000,
                                 order: 1,
                                 show_on_index: true,
                                 call_to_action_text: "Create Some task_group Now!",
                                 header_image: HeaderImage.first)


p "----------- Package Type task_group - Default Project  ----------"
task_group_default_project = Project.create!(package_type_id: task_group.id,
                                     company_id: 1,
                                     title: "task_group Package Project - Default Template",
                                     brief: 'Paste your creative brief here, or call us to help create one.',
                                     deadline: Date.today + 60.days,
                                     price: task_group.base_price,
                                     is_complete: false,
                                     max_user_shot_list: 25,
                                     is_template: true,
                                     is_default_template: true)

p "----------- Package Type task_group - Default Photo Shoot  ----------"

task_group_default_photo_shoot = Shoot.create!(project_id: task_group_default_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        content_type: ContentType.photo,
                                        brief: task_group_default_project.brief,
                                        price: 3500,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: task_group_default_project.deadline,
                                        user_added_shot_count_max: task_group_default_project.max_user_shot_list)


p "----------- Package Type task_group - Default Video Shoot  ----------"

task_group_default_video_shoot = Shoot.create!(project_id: task_group_default_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        content_type: ContentType.video,
                                        brief: task_group_default_project.brief,
                                        price: 8500,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: task_group_default_project.deadline,
                                        user_added_shot_count_max: task_group_default_project.max_user_shot_list)

p "----------- Package Type task_group - Shoots Completed  ----------"

p "----------- Package Type task_group - Shot List Items  ----------"

task_group_1 = TaskGroup.create!(title: 'The First Group', shoot: task_group_default_photo_shoot, order: 1)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Sun (light) shining through person/feture',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_1)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Flared out staged imagery ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_1)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'hero shot of person/feature low angle ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_1)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'hero shot of person/feature high angle ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_1)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'hero shot of person/feature tight angle ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_1)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'hero shot of person/feature wide angle ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_1)

task_group_2 = TaskGroup.create!(title: 'The Second Group', shoot: task_group_default_photo_shoot, order: 2)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Smiling Interaction',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_2)
task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'multiples for motion for overlay/sequence ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_2)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'shot with hands up or jumping ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_2)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'multiples for motion for overlay/sequence ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_2)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'moment of reflection with positive mood',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_2)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'use of reflection on person/subject',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_2)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'use of shaddow for person/subject',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_2)

task_group_3 = TaskGroup.create!(title: 'The Third Group', shoot: task_group_default_photo_shoot, order: 3)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'shot of person taking ownership ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_3)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'multiple people interacting with person/feature low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_3)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'multiple people interacting with person/feature high',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_3)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'multiple people interacting with person/feature tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_3)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'multiple people interacting with person/feature tight',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_3)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'multiple people interacting with person/feature wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_3)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Celebration Solo',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_3)

task_group_4 = TaskGroup.create!(title: 'The Fourth Group', shoot: task_group_default_photo_shoot, order: 4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Celebration collaborative',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Celebration collaborative wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)


task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'eyes on person/feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'captive audience (people or items)',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Straight Shot of person/feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Straight Shot of person/feature wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Straight Shot of person/feature mid',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Straight Shot of person/feature low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Straight Shot of person/feature tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)


task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Angle Shot of Person or Feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Angle Shot of Person or Feature low ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Angle Shot of Person or Feature wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Angle Shot of Person or Feature tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Angle Shot of Person or Feature mid',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Angle Shot of Person or Feature high',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Establishing Shot of Person or Feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Establishing Shot of Person or Feature low ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Establishing Shot of Person or Feature mid ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Establishing Shot of Person or Feature tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)
task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Establishing Shot of Person or Feature high ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Establishing Shot of Person or Feature Wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Action Shot Mid ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Action Shot Tight ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)

task_group_photo = ShotListItem.create!(shoot: task_group_default_photo_shoot,
                                         description: 'Action Shot Wide',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_4)


task_group_5 = TaskGroup.create!(title: 'The Fifth Group', shoot: task_group_default_video_shoot, order: 1)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: '(Sun) Light shining through Person or Feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_5)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Flared out Staged Imagery',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_5)


task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Hero Shot of Person or Feature - Low Angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_5)


task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Hero Shot of Person or Feature - High Angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_5)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Hero Shot of Person or Feature - Tight Angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_5)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Hero Shot of Person or Feature - Wide Angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_5)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Smiling Interaction',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_5)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Motion for Overlay 1',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_5)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Motion for Overlay 2',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_5)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Motion for Overlay 3',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_5)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Motion for Overlay 4',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_5)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Shot of Model with hands up or jumping',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_5)

task_group_6 = TaskGroup.create!(title: 'The Sixth Group', shoot: task_group_default_video_shoot, order: 2)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Moment of reflection with positive mood',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_6)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Use of Reflection for person or subject ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_6)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Use of Shaddow for person or subject ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_6)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Person or subject taking ownership',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_6)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Multiple People interacting with Subject - Low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_6)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Multiple People interacting with Subject - High',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_6)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Multiple People interacting with Subject - Tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_6)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Multiple People interacting with Subject - Wide',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_6)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Cellebration Solo Panning',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_6)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Cellebration Collaboration',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_6)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Cellebration Collaboration Wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_6)

task_group_7 = TaskGroup.create!(title: 'The Seventh Group', shoot: task_group_default_video_shoot, order: 3)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Eyes on Person / Feature Pull Away',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_7)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Captive Audience (People or Items)',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_7)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Straight Shot of Person or Feature - Focus Pull ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_7)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Straight Shot of Person or Feature - Wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_7)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Straight Shot of Person or Feature - Mid ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_7)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Straight Shot of Person or Feature - Low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_7)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Straight Shot of Person or Feature - Tight - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_7)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Straight Shot of Person or Feature - High - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_7)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Angle Shot of Person or Feature - Focus Pull ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_7)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Angle Shot of Person or Feature - Wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_7)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Angle Shot of Person or Feature - Mid ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_7)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Angle Shot of Person or Feature - Low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_7)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Angle Shot of Person or Feature - Tight - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_7)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Angle Shot of Person or Feature - High - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_7)

task_group_8 = TaskGroup.create!(title: 'The Eighth Group', shoot: task_group_default_video_shoot, order: 4)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Action Shot of Person or Feature - Tight - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_8)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Action Shot of Person or Feature - Low - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_8)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Action Shot of Person or Feature - Mid - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_8)

task_group_video = ShotListItem.create!(shoot: task_group_default_video_shoot,
                                         description: 'Action Shot of Person or Feature - High - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: task_group_8)


p "----------- Package Type task_group - Shoot List Items Completed  ----------"
