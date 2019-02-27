#TODO: Fill Out With Justin

#Excitement Package
zack_admin = User.where(email: 'zack@nomcre.com').first

p "----------- Package Type Excitement ----------"

excitement = PackageType.create!(title: "Excitement",
                                 subtitle: "We Create Hype!",
                                 description: "Creating excitement for a product, person, buidling, service or business",
                                 description_image: "www.nomcre.com/excitement_description image",
                                 show_in_menu: true,
                                 menu_link_text: 'Hype Up Your Audience!',
                                 minimum_images: 365,
                                 minimum_videos: 40,
                                 max_models: 2,
                                 base_price: 12000,
                                 order: 1,
                                 show_on_index: true,
                                 call_to_action_text: "Create Some Excitement Now!",
                                 header_image: HeaderImage.first)


p "----------- Package Type Excitement - Default Project  ----------"
excitement_default_project = Project.create!(package_type_id: excitement.id,
                                     company_id: 1,
                                     title: "Excitement Package Project - Default Template",
                                     brief: 'Paste your creative brief here, or call us to help create one.',
                                     deadline: Date.today + 60.days,
                                     price: excitement.base_price,
                                     is_complete: false,
                                     max_user_shot_list: 25,
                                     is_template: true,
                                     is_default_template: true)

p "----------- Package Type Excitement - Default Photo Shoot  ----------"

excitement_default_photo_shoot = Shoot.create!(project_id: excitement_default_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        content_type: ContentType.photo,
                                        brief: excitement_default_project.brief,
                                        price: 3500,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: excitement_default_project.deadline,
                                        user_added_shot_count_max: excitement_default_project.max_user_shot_list)


p "----------- Package Type Excitement - Default Video Shoot  ----------"

excitement_default_video_shoot = Shoot.create!(project_id: excitement_default_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        content_type: ContentType.video,
                                        brief: excitement_default_project.brief,
                                        price: 8500,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: excitement_default_project.deadline,
                                        user_added_shot_count_max: excitement_default_project.max_user_shot_list)

p "----------- Package Type Excitement - Shoots Completed  ----------"

p "----------- Package Type Excitement - Shot List Items  ----------"
#logo_group = TaskGroup.create!(title: "Logo Group", shoot: excitement_default_photo_shoot, order: 1)
#TODO: Create Logo Items

hero_group = TaskGroup.create!(title: "Hero Shots", shoot: excitement_default_photo_shoot, order: 2, shoot_type: ContentType.photo)
excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'hero shot of person/feature low angle ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: hero_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'hero shot of person/feature high angle ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: hero_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'hero shot of person/feature tight angle ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: hero_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'hero shot of person/feature wide angle ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: hero_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Sun (light) shining through person/feture',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: hero_group)


establishing_group = TaskGroup.create!(title: "Excitement - Establishing", shoot: excitement_default_photo_shoot, order: 3, shoot_type: ContentType.photo)
excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Establishing Shot of Person or Feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: establishing_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Establishing Shot of Person or Feature low ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: establishing_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Establishing Shot of Person or Feature mid ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: establishing_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Establishing Shot of Person or Feature tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         task_group: establishing_group)
                                         added_by_id: zack_admin.id)
excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Establishing Shot of Person or Feature high ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: establishing_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Establishing Shot of Person or Feature Wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: establishing_group)



interactions_people_group = TaskGroup.create!(title: "Excitement - Interactions with people", shoot: excitement_default_photo_shoot, order: 4, shoot_type: ContentType.photo)
excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'multiple people interacting with person/feature low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: interactions_people_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'multiple people interacting with person/feature high',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: interactions_people_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'multiple people interacting with person/feature tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: interactions_people_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'multiple people interacting with person/feature tight',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: interactions_people_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'multiple people interacting with person/feature wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: interactions_people_group)


excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Smiling Interaction',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: interactions_people_group)


excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'shot with hands up or jumping ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: interactions_people_group)


excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'moment of reflection with positive mood',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: interactions_people_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'shot of person taking ownership ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: interactions_people_group)



excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Celebration Solo',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: interactions_people_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Celebration collaborative',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: interactions_people_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Celebration collaborative wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: interactions_people_group)





item_interaction_group = TaskGroup.create!(title: "Interaction With Item", shoot: excitement_default_photo_shoot, order: 3, shoot_type: ContentType.photo)
excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'eyes on person/feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'captive audience (people or items)',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Straight Shot of person/feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Straight Shot of person/feature wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Straight Shot of person/feature mid',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Straight Shot of person/feature low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Straight Shot of person/feature tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)


excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Angle Shot of Person or Feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Angle Shot of Person or Feature low ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Angle Shot of Person or Feature wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Angle Shot of Person or Feature tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Angle Shot of Person or Feature mid',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Angle Shot of Person or Feature high',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Flared out staged imagery',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)


excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'multiples for motion for overlay/sequence 1 (rapid fire)',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)


excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'multiples for motion for overlay/sequence 2 (rapid fire)',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)


excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'use of reflection on person/subject',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'use of shaddow for person/subject',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: item_interaction_group)


action_group = TaskGroup.create!(title: "Action", shoot: excitement_default_photo_shoot, order: 5)
excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Action Shot Mid ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: action_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Action Shot Tight ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: action_group)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo_shoot,
                                         description: 'Action Shot Wide',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: action_group)

###########################################################################################################

hero_group = TaskGroup.create!(title: "Hero Shots - Video", shoot: excitement_default_photo_shoot, order: 1, shoot_type: ContentType.video)
excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Hero Shot of Person or Feature - Low Angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: hero_group)


excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Hero Shot of Person or Feature - High Angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: hero_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Hero Shot of Person or Feature - Tight Angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: hero_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Hero Shot of Person or Feature - Wide Angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: hero_group)

creative_flair_group = TaskGroup.create!(title: "Excitement - Creative Flair", shoot: excitement_default_photo_shoot, order: 3, shoot_type: ContentType.video)
excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: '(Sun) Light shining through Person or Feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: creative_flair_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Flared out Staged Imagery',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: creative_flair_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Motion for Overlay 1',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group:

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Motion for Overlay 2',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: creative_flair_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Motion for Overlay 3',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: creative_flair_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Motion for Overlay 4',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: creative_flair_group)


people_interaction_group = TaskGroup.create!(title: "Angles of People", shoot: excitement_default_photo_shoot, order: 5, shoot_type: ContentType.video)
excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Smiling Interaction',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Shot of Model with hands up or jumping',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Moment of reflection with positive mood',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Use of Reflection for person or subject ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Use of Shaddow for person or subject ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Person or subject taking ownership',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Multiple People interacting with Subject - Low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Multiple People interacting with Subject - High',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Multiple People interacting with Subject - Tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Multiple People interacting with Subject - Wide',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Cellebration Solo Panning',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Cellebration Collaboration',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Cellebration Collaboration Wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Eyes on Person / Feature Pull Away',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Captive Audience (People or Items)',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: people_interaction_group)


straight_people_group = TaskGroup.create!(title: "Straight on of People", shoot: excitement_default_photo_shoot, order: 5, shoot_type: ContentType.video)
excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Straight Shot of Person or Feature - Focus Pull ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: straight_people_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Straight Shot of Person or Feature - Wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: straight_people_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Straight Shot of Person or Feature - Mid ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: straight_people_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Straight Shot of Person or Feature - Low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: straight_people_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Straight Shot of Person or Feature - Tight - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: straight_people_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Straight Shot of Person or Feature - High - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: straight_people_group)

angle_people_group = TaskGroup.create!(title: "Angles of People", shoot: excitement_default_photo_shoot, order: 5)
excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Angle Shot of Person or Feature - Focus Pull ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: angle_people_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Angle Shot of Person or Feature - Wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: angle_people_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Angle Shot of Person or Feature - Mid ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: angle_people_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Angle Shot of Person or Feature - Low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: angle_people_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Angle Shot of Person or Feature - Tight - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: angle_people_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Angle Shot of Person or Feature - High - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: angle_people_group)


action_group = TaskGroup.create!(title: "Action Shots", shoot: excitement_default_photo_shoot, order: 5, shoot_type: ContentType.video)
excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Action Shot of Person or Feature - Tight - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: action_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Action Shot of Person or Feature - Low - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: action_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Action Shot of Person or Feature - Mid - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: action_group)

excitement_video = ShotListItem.create!(shoot: excitement_default_video_shoot,
                                         description: 'Action Shot of Person or Feature - High - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id,
                                         task_group: action_group)


p "----------- Package Type Excitement - Shoot List Items Completed  ----------"



#PackageType - PropertyManagement
#PackageType - ProductLaunch
#PackageType - Credibility
#PackageType - SinglePhotoShoot
#PackageType - SingleVideoShoot



#Project - Excitement - Default Template

#Project - PropertyManagement - Default Template
#Project - ProductLaunch - Default Template
#Project - Credibility - Default Template
#Project - SinglePhotoShoot - Default Template
#Project - SingleVideoShoot - Default Template

#Shoots - Excitement - Default Template




#Shoots - PropertyManagement - Default Template
#Shoots - ProductLaunch - Default Template
#Shoots - Credibility - Default Template
#Shoots - SinglePhotoShoot - Default Template
#Shoots - SingleVideoShoot - Default Template

#ShotList - Excitement - Default Template



#ShotList - PropertyManagement - Default Template
#ShotList - ProductLaunch - Default Template
#ShotList - Credibility - Default Template
#ShotList - SinglePhotoShoot - Default Template
#ShotList - SingleVideoShoot - Default Template

#Tasks - Excitement - Default Template
#Tasks - PropertyManagement - Default Template
#Tasks - ProductLaunch - Default Template
#Tasks - Credibility - Default Template
#Tasks - SinglePhotoShoot - Default Template
#Tasks - SingleVideoShoot - Default Template
