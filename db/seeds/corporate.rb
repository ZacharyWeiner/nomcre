#Scripted BRoll ... What Do We need to include?



p "----------- Package Type maverick - Default Package  ----------"
maverick_package = PackageType.create!(title: "Corporate Package",
                                 subtitle: "Create A Video and Asset Library to Showcase Your Corporate Ethos!",
                                 description: "Showcase you business and company culture through a series of engaging videos and photos optimized for digital consumption.",
                                 description_image: "www.nomcre.com/excitement_description image",
                                 show_in_menu: false,
                                 menu_link_text: 'Make Your Business Shine!',
                                 minimum_images: 3,
                                 minimum_videos: 10,
                                 max_models: 0,
                                 base_price: 12500,
                                 order: 9,
                                 show_on_index: true,
                                 call_to_action_text: "Create Your Corporate Package Now!",
                                 header_image: HeaderImage.first)


p "----------- Package Type maverick - Default Project  ----------"

custom_maverick_project = Project.create!(package_type_id: maverick_package.id,
                                     company_id: 1,
                                     title: "Corporate Package - Default Template",
                                     brief: 'Paste your creative brief here, or call us to help create one.',
                                     deadline: Date.today + 60.days,
                                     price: maverick_package.base_price,
                                     is_complete: false,
                                     max_user_shot_list: 50,
                                     is_template: true,
                                     is_default_template: true)



p "----------- Package Type maverick - Default Photo Shoot  ----------"

maverick_default_photo_shoot = Shoot.create!(project_id: custom_maverick_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        content_type: ContentType.photo,
                                        brief: custom_maverick_project.brief,
                                        price: 5000,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: custom_maverick_project.deadline,
                                        user_added_shot_count_max: custom_maverick_project.max_user_shot_list)


p "----------- Package Type maverick - Default Video Shoot  ----------"

maverick_default_video_shoot = Shoot.create!(project_id: custom_maverick_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        content_type: ContentType.video,
                                        brief: custom_maverick_project.brief,
                                        price: 10000,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: custom_maverick_project.deadline,
                                        user_added_shot_count_max: custom_maverick_project.max_user_shot_list)




p "----------- Package Type maverick - Default Video Shot List  ----------"

@zack_admin = User.where(email: 'zack@nomcre.com').first

jabil_scripted = TaskGroup.create!(title: 'Client Executive Scripted', shoot: maverick_default_video_shoot, order: 1, shoot_style: ContentType.video)
maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_scripted,
                                    description: 'Client Executive Script 1',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_group,
                                    description: 'Client Executive Office B-Roll 1 ',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_group,
                                    description: 'Client Executive Office B-Roll 2',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_group,
                                    description: 'Client Executive Office B-Roll 3 (Slow Motion)',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_group,
                                    description: 'Client Executive Office B-Roll 4 (Slow Motion)',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_scripted,
                                    description: 'Client Executive Talking about Maverick 1 - How is CasS an advantage for him?',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_scripted,
                                    description: 'Client Executive Script 2 ',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_scripted,
                                    description: 'Client Executive Script 3 ',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_scripted,
                                    description: 'Client Executive Script 4',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_scripted,
                                    description: 'Client Executive Script 5',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_scripted,
                                    description: 'Client Executive - Tell The Camera About Mavericks Expertise - Read AdLib',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_scripted,
                                    description: 'Client Executive - About Mavericks execllent service ',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_scripted,
                                    description: 'Client Executive - On Strategic Partners and Expertise on Implementation',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_scripted,
                                    description: 'Client Executive - Talking about working with the people of Maverick ',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

jabil_script_b_roll = TaskGroup.create!(title: 'Client Executive Scripted - B Roll', shoot: maverick_default_video_shoot, order: 2, shoot_style: ContentType.video)
maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_script_b_roll,
                                    description: 'B-Roll for Consulting as a Serice',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_group,
                                    description: 'Client Executive B Roll For Off The Cuff',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)



maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_script_b_roll,
                                    description: 'Client Executive B Roll for Script 2 ',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                     task_group: jabil_script_b_roll,
                                    description: 'Client Executive B Roll for Script 3',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                     task_group: jabil_script_b_roll,
                                    description: 'Client Executive B Roll for Script 4',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                     task_group: jabil_script_b_roll,
                                    description: 'Client Executive B Roll for Script 5',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


jabil_unscripted = TaskGroup.create!(title: 'Client Executive Un-scripted', shoot: maverick_default_video_shoot, order: 3, shoot_style: ContentType.video)
maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscripted,
                                    description: 'Client Executive Off the cuff 1 ',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscripted,
                                    description: 'Client Executive - Talks About Client Delight',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscripted,
                                    description: 'Client Executive - Talks About High performance ',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscripted,
                                    description: 'Client Executive - Talks About Honest Communication',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscripted,
                                    description: 'Client Executive - Think Big',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscripted,
                                    description: 'Client Executive - Be Bold',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_scripted,
                                    description: 'Client Executive - Closing Statement Script ',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscripted,
                                    description: 'Client Executive - Talks about Serice Value - Trust & Excelent Service',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscripted,
                                    description: 'Client Executive - Talks about why they chooses to work with Maverick',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

jabil_unscript_b_roll = TaskGroup.create!(title: 'Jabil Unscripted - B Roll', shoot: maverick_default_video_shoot, order: 2, shoot_style: ContentType.video)
maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscript_b_roll,
                                    description: 'Client Executive Office B-Roll 6',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscript_b_roll,
                                    description: 'Client Executive Office B-Roll 7',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscript_b_roll,
                                    description: 'Client Executive Office B-Roll 8',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscript_b_roll,
                                    description: 'Client Executive Office B-Roll 9',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscript_b_roll,
                                    description: 'Client Executive Office B-Roll 10 ',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscript_b_roll,
                                    description: 'Client Executive Office B-Roll 11',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscript_b_roll,
                                    description: 'Client Executive Office B-Roll 12',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


jabil_unscript_b_roll = TaskGroup.create!(title: 'Client SE - Scripted & B Roll', shoot: maverick_default_video_shoot, order: 6, shoot_style: ContentType.video)
maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscript_b_roll,
                                    description: 'Client SE Script 1  ',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscript_b_roll,
                                    description: 'Client SE B Roll 1',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscript_b_roll,
                                    description: 'Client SE B Roll 2',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

maverick_video_clip = ShotListItem.create!(shoot: maverick_default_video_shoot,
                                    task_group: jabil_unscript_b_roll,
                                    description: 'Client SE B Roll 3',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)




jabil_office_photos = TaskGroup.create!(title: 'Client Executive Office Photos', shoot: maverick_default_photo_shoot, order: 1, shoot_style: ContentType.photo)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_office_photos,
                                    description: 'Exterior',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_office_photos,
                                    description: 'Logo - dead on off center (either right or left side)',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_office_photos,
                                    description: 'Entry Way ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_office_photos,
                                    description: 'Reception',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_office_photos,
                                    description: 'In Office 1 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_office_photos,
                                    description: 'In Office 2 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_office_photos,
                                    description: 'In Office 3',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_office_photos,
                                    description: 'In Office 4 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_office_photos,
                                    description: 'In Office 5',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)


jabil_executive_photos = TaskGroup.create!(title: 'Jabil Office Photos', shoot: maverick_default_photo_shoot, order: 1, shoot_style: ContentType.photo)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive 1 - Photo 1 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive 1 - Photo 2 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive 1 - Photo 3 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive 1 - Photo 4 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive 1 - Photo 5 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive or Employee 2 - Photo 1 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive or Employee 2 - Photo 2  ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive or Employee 2 - Photo 3 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive or Employee 2 - Photo 4 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive or Employee 2 - Photo 5 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive or Employee 3 - Photo 1 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive or Employee 3 - Photo 1 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive or Employee 3 - Photo 1 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive or Employee 3 - Photo 1 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
maverick_jabil_photo = ShotListItem.create!(shoot: maverick_default_photo_shoot,
                                    task_group: jabil_executive_photos,
                                    description: 'Executive or Employee 3 - Photo 1 ',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)
