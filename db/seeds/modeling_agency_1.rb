
zack_admin = User.where(email: 'zack@nomcre.com').first

p "----------- Package Type Modeling Agency 1  ----------"
modeling_agency_2 = PackageType.create!(title: "Modeling Agency 2",
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
modeling_agency_default_project = Project.create!(package_type_id: modeling_agency_2.id,
                   company_id: 1,
                   title: "Modeling Agency - Default Template",
                   brief: 'Paste your creative brief here, or call us to help create one.',
                   deadline: Date.today + 60.days,
                   price: modeling_agency_2.base_price,
                   is_complete: false,
                   max_user_shot_list: 1,
                   is_template: true,
                   is_default_template: true)


p "----------- Package Type Modeling Agency 1 - Default Video Shoot  ----------"
modeling_agency_shoot_2 = Shoot.create!(project_id: modeling_agency_default_project.id,
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






modeling_agency_default_project.reload()
shoot = modeling_agency_shoot_2
for i in 1..8 do

  model_basics_group = TaskGroup.create!(title: "Model #{i}", shoot: shoot, order: 1, shoot_type: ContentType.video)
  model_basics_group = TaskGroup.last
  model_sporty = TaskGroup.create!(title: "Model #{i} - Sporty", shoot: shoot, order: 1, shoot_type: ContentType.video, parent: model_basics_group)
  model_sporty = TaskGroup.last
    model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Head turn to camera (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)

  model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot With Model Movement (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)


model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Chest to Head - Model Turning Head (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Model in Motion Front',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 FPS - Regular',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Model in Motion Side',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 FPS - Regular',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Side Profile Mid Shot - Model Turning to Camera (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Knees To Head - Model Walking to Camera and Stop - No Camera Motion',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regualr',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Knees To Head - Model Walking to Camera and Stop - Camera Backing Up even after model stop',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Hip To Head - Model Turning (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Close up of Model Face Looking Into Camera (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Close up of Model Face Angle 2 Looking Into Camera (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Close up of Model Face Turning Into Camera with Smile (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body - Model Playful Energy - Camera Pulling Away From Model',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)


model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot Pan Down Body (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Model Looking Back Over Shoulder to Camera (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot Pull Camera up of Model Spinning',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regualr',
                                       task_group: model_sporty)


model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot Model Running Hand Through Hair (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot Model Running Hair Twist (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot Camera Move Into Face',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Model Walking Camera on Follow Angle (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Model Walking Camera on Follow Angle',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_sporty)


model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot Model Walking And Bouncing',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Model Motion With Smile',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot Model Interacting with Clothing',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Model Interacting with Clothing',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Model Interacting with Clothing (Slow Motion)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_sporty)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Drastic Pull Away - Model Changing Poses',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_sporty)

  model_fashion = TaskGroup.create!(title: "Model #{i} - Fashion", shoot: shoot, order: 1, shoot_type: ContentType.video, parent_id: model_basics_group.id)
  model_fashion = TaskGroup.last
  model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Head turn to camera (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)

  model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot With Model Movement (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Chest to Head - Model Turning Head (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Model in Motion Front',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 FPS - Regular',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Model in Motion Side',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 FPS - Regular',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Side Profile Mid Shot - Model Turning to Camera (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Knees To Head - Model Walking to Camera and Stop - No Camera Motion',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regualr',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Knees To Head - Model Walking to Camera and Stop - Camera Backing Up even after model stop',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Hip To Head - Model Turning (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Close up of Model Face Looking Into Camera (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Close up of Model Face Angle 2 Looking Into Camera (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Close up of Model Face Turning Into Camera with Smile (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body - Model Playful Energy - Camera Pulling Away From Model',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)


model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot Pan Down Body (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Model Looking Back Over Shoulder to Camera (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot Pull Camera up of Model Spinning',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regualr',
                                       task_group: model_fashion)


model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot Model Running Hand Through Hair (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot Model Running Hair Twist (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot Camera Move Into Face',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Model Walking Camera on Follow Angle (Super Slow)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '120 FPS - Super Slow',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Model Walking Camera on Follow Angle',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_fashion)


model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot Model Walking And Bouncing',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Model Motion With Smile',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Mid Shot Model Interacting with Clothing',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Model Interacting with Clothing',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Model Interacting with Clothing (Slow Motion)',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_fashion)

model_basic_clip = ShotListItem.create!(shoot: shoot,
                                       description: 'Full Body Drastic Pull Away - Model Changing Poses',
                                       aspect_ratio: 'portrait',
                                       background: "From brief",
                                       item_type: 'video',
                                       focus_point: 'Best Practices',
                                       shoot_location: "On Set",
                                       added_by_id: zack_admin.id,
                                       frame_rate: '24.4 - Regular',
                                       task_group: model_fashion)

end


