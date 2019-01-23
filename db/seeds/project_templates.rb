#TODO: Fill Out With Justin

#Excitement Package
zack_admin = User.where(email: 'zack@nomcre.com').first

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

excitement_default_photo = Shoot.create(project_id: excitement_default_project,
                                        company_id: 1,
                                        location_id: 111,
                                        content_type: ContentType.photo,
                                        brief: excitement_default_project.brief,
                                        price: 3500,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first)

excitement_default_video = Shoot.create(project_id: excitement_default_project,
                                        company_id: 1,
                                        location_id: 111,
                                        content_type: ContentType.video,
                                        brief: excitement_default_project.brief,
                                        price: 8500,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first)


excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Sun (light) shining through person/feture',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Flared out staged imagery ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'hero shot of person/feature low angle ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'hero shot of person/feature high angle ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'hero shot of person/feature tight angle ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'hero shot of person/feature wide angle ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Smiling Interaction',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)
excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'multiples for motion for overlay/sequence ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'shot with hands up or jumping ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'multiples for motion for overlay/sequence ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'moment of reflection with positive mood',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'use of reflection on person/subject',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'use of shaddow for person/subject',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'shot of person taking ownership ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'multiple people interacting with person/feature low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'multiple people interacting with person/feature high',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'multiple people interacting with person/feature tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'multiple people interacting with person/feature tight',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'multiple people interacting with person/feature wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Celebration Solo',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Celebration collaborative',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Celebration collaborative wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)


excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'eyes on person/feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'captive audience (people or items)',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Straight Shot of person/feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Straight Shot of person/feature wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Straight Shot of person/feature mid',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Straight Shot of person/feature low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Straight Shot of person/feature tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)


excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Angle Shot of Person or Feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Angle Shot of Person or Feature low ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Angle Shot of Person or Feature wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Angle Shot of Person or Feature tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Angle Shot of Person or Feature mid',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Angle Shot of Person or Feature high',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Establishing Shot of Person or Feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Establishing Shot of Person or Feature low ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Establishing Shot of Person or Feature mid ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Establishing Shot of Person or Feature tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)
excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Establishing Shot of Person or Feature high ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Establishing Shot of Person or Feature Wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Action Shot Mid ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Action Shot Tight ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_photo = ShotListItem.create!(shoot: excitement_default_photo,
                                         description: 'Action Shot Wide',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'photo',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)



excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: '(Sun) Light shining through Person or Feature',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Flared out Staged Imagery',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)


excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Hero Shot of Person or Feature - Low Angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)


excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Hero Shot of Person or Feature - High Angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Hero Shot of Person or Feature - Tight Angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Hero Shot of Person or Feature - Wide Angle',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Smiling Interaction',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Motion for Overlay 1',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Motion for Overlay 2',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Motion for Overlay 3',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Motion for Overlay 4',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Shot of Model with hands up or jumping',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Moment of reflection with positive mood',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Use of Reflection for person or subject ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Use of Shaddow for person or subject ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Person or subject taking ownership',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Multiple People interacting with Subject - Low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Multiple People interacting with Subject - High',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Multiple People interacting with Subject - Tight',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Multiple People interacting with Subject - Wide',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Cellebration Solo Panning',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Cellebration Collaboration',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Cellebration Collaboration Wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Eyes on Person / Feature Pull Away',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Captive Audience (People or Items)',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Straight Shot of Person or Feature - Focus Pull ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Straight Shot of Person or Feature - Wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Straight Shot of Person or Feature - Mid ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Straight Shot of Person or Feature - Low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Straight Shot of Person or Feature - Tight - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Straight Shot of Person or Feature - High - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Angle Shot of Person or Feature - Focus Pull ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Angle Shot of Person or Feature - Wide',
                                         aspect_ratio: 'landscape',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Angle Shot of Person or Feature - Mid ',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Angle Shot of Person or Feature - Low',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Angle Shot of Person or Feature - Tight - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Angle Shot of Person or Feature - High - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Action Shot of Person or Feature - Tight - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Action Shot of Person or Feature - Low - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Action Shot of Person or Feature - Mid - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)

excitement_video = ShotListItem.create!(shoot: excitement_default_video,
                                         description: 'Action Shot of Person or Feature - High - Focus Pull',
                                         aspect_ratio: 'portrait',
                                         background: "From brief",
                                         item_type: 'video',
                                         focus_point: 'Best Practices',
                                         shoot_location: "On Set",
                                         added_by_id: zack_admin.id)



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
