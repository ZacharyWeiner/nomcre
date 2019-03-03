hotel_package = PackageType.create!(title: "Hotels",
                                 subtitle: "Beautiful Imagery for Better Bookings",
                                 description: "The Nomcre way ensures that you have the assets to be agile in your marketing campaigns. We build a visual library of stories to bring to life the aspects of your property that make it unique. Nomadic capture your guest experiences, through showcasing the ammenities, decor, vibe, and staff, and the surrounding neighborhood. When shooting for hotels, we create a series of visual micro-stories to drive revenue from your social channels as well as crafting beautifully constructed images to benefit all of your marketing efforts.",
                                 description_image: "www.nomcre.com/excitement_description image",
                                 show_in_menu: true,
                                 menu_link_text: 'Increase Your Bookings with Beautiful Imagery',
                                 minimum_images: 365,
                                 minimum_videos: 10,
                                 max_models: 0,
                                 base_price: 15000,
                                 order: 2,
                                 show_on_index: true,
                                 add_default_shot_list: true,
                                 call_to_action_text: "Get More Bookings Today!",
                                 header_image: HeaderImage.first)


p "----------- Package Type Hotels - Default Project  ----------"
hotels_default_project = Project.create!(package_type_id: hotel_package.id,
                                     company_id: 1,
                                     title: "Hotel Package Project - Default Template",
                                     deadline: Date.today + 60.days,
                                     price: hotel_package.base_price,
                                     is_complete: false,
                                     max_user_shot_list: 25,
                                     is_template: true,
                                     is_default_template: true,
                                      brief: "Describe the vibe of the hotel and guest experience, feel free to provide some links or visual expamples
                                            What make the property unique?
                                            Who are your top two types of guest profiles?
                                            What memories do you want your guests to take home with them?
                                            What is the best way this location creates repeat business?
                                            What type of guest group are you looking to increase bookings?
                                            Do you have a special holiday or event that the propperty really gets excited about?






                                            Is there a special drink at the bar that is a 'must have'?
                                            Are there any major obstructions in viewing the main exterior?
                                            Are there any major shaddows cast on the entrance exterior during the day?

                                            What exterior features should we absolutely capture?
                                            At what time is ammenitiy 1 available with low traffic and noise
                                            At what time is ammenitiy 2 available with low traffic and noise
                                            At what time is ammenitiy 3 available with low traffic and noise

                                            At what time of day is the lobby most photogenic?
                                            What decor features should we absolutely capture?
                                            What time of day is Guest Room 1 most photogenic?
                                            What time of day is Guest Room 2 most photogenic?
                                            What time of day is Guest Room 3 most photogenic?
                                            What are the names of the staff members (bar, restauraunt, valet, bellhops) are planned to be in the shoot?
                                            Is there any anticipated construction in the near future?")

p "----------- Package Type Hotels - Default Photo Shoot  ----------"

hotels_default_photo_shoot = Shoot.create!(project_id: hotels_default_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        content_type: ContentType.photo,
                                        brief: hotels_default_project.brief,
                                        price: 5000,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: hotels_default_project.deadline,
                                        user_added_shot_count_max: hotels_default_project.max_user_shot_list)


p "----------- Package Type Hotels - Default Video Shoot  ----------"

hotels_default_video_shoot = Shoot.create!(project_id: hotels_default_project.id,
                                        company_id: 1,
                                        location_id: 111,
                                        content_type: ContentType.video,
                                        brief: hotels_default_project.brief,
                                        price: 10000,
                                        shoot_style: ShootStyle.mixed,
                                        location: Location.first,
                                        deadline: hotels_default_project.deadline,
                                        user_added_shot_count_max: hotels_default_project.max_user_shot_list)

p "----------- Package Type Hotels - Shoots Completed  ----------"
p "----------- Package Type Hotels - Video Shot List Items  ----------"
@zack_admin = User.where(email: 'zack@nomcre.com').first

hotel_video_group_exterior = TaskGroup.create!(title: 'Hotels - Exterior', shoot: hotels_default_video_shoot, order: 1)
hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Establishing Shot - Neighborhood',
                                    aspect_ratio: 'landscape',
                                    background: 'on site',
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Establishing shot - Exterior Building (All sides)',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate:    "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Establishing shot - Drone Shot of Structure',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate:    "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Establishing Shot - Drone Pull Away',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate:    "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Establishing shot - Drone pan of structure',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate:     "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Establishing shot - Drone Diagonal Fly Over',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate:    "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Wide shot - outside pan or tilt as far away from the building as possible',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate:    "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'walk up on ronin, drone or car',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate:     "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Mid action shot of entranceway action. Cars pulling up or valet/bellhop',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate:    "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Details shots of - Branded signage, main lit logo, unique facade elements',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate:    "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Wide shot of unique facade elements',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate:    "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Logo - dead on off center (either right or left side)',
                                    aspect_ratio: 'portrait  ',
                                    background: 'on site',
                                    focus_point: 'center',
                                    added_by_id: @zack_admin.id,
                                    item_type: 'video',
                                    frame_rate:  "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Logo - dead on off center (either right or left side)',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate:    "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Drone arc and back of the exterior of the building (not directly forward or back, must curve)',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate:    "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Drone or GoPro follow to entrance.',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate: "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Building Exterior - Night Time Extended exposure (sun flare if possible)',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate:     "24.4 - Regular Speed")

hotels_video = ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_exterior,
                                    description: 'Focus Pull from cafe or street sign with a building reveal',
                                    aspect_ratio: 'landscape',
                                    background:  'on site',
                                    focus_point:  'center',
                                    added_by_id: @zack_admin.id,
                                    item_type:  'video',
                                    frame_rate:     "24.4 - Regular Speed")

hotel_video_group_neighborhood = TaskGroup.create!(title: 'Hotels - Neighborhood', shoot: hotels_default_video_shoot, order: 2)
ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_neighborhood,
                                    description: 'Neighborhood B-Roll Shot 1' ,
                                    aspect_ratio: 'landscape',
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate: "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_neighborhood,
                                    description: 'Neighborhood B-Roll Shot 2' ,
                                    aspect_ratio: 'landscape',
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:     "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_neighborhood,
                                    description: 'Neighborhood B-Roll Shot 3' ,
                                    aspect_ratio: 'landscape',
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:     "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_neighborhood,
                                    description: 'Neighborhood B-Roll Shot 4' ,
                                    aspect_ratio: 'landscape',
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:     "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_neighborhood,
                                    description: 'Neighborhood B-Roll Shot 5' ,
                                    aspect_ratio: 'landscape',
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate:     "24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

hotel_video_group_lobby = TaskGroup.create!(title: 'Hotels - Lobby', shoot: hotels_default_video_shoot, order: 3)
ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby,
                                    description: 'Lobby - Straight shot panning or zooming in.',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_neighborhood,
                                    description: 'Lobby - Tight shot of the welcome area or concierge (exclude any papers or computers)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby,
                                    description: 'Lobby - From Reception looking toward guest entry',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_neighborhood,
                                    description: 'Lobby - Walk through from front door to front desk',
                                     aspect_ratio: "landscape",
                                     background: "on site",
                                     focus_point: "center",
                                     item_type: "video",
                                     frame_rate:"24.4 - Regular Speed",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby,
                                    description: 'Lobby - walk through from front door to concierge',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_neighborhood,
                                    description: 'Lobby - from waiting area to the door',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby,
                                    description: 'Lobby - Walking arc',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_neighborhood,
                                    description: 'Lobby - Pan lobby side 1',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby,
                                    description: 'Lobby - Pan lobby side 2',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby,
                                    description: 'Walkthrough - Lobby to elevator',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate: '24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby,
                                    description: 'Walkthrough - Bar or Restaurant',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate: '24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby,
                                    description: 'Walkthrough - Lobby to Eating area',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate: '24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby,
                                    description: 'Pan/Action of eating area.',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate: '24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby,
                                    description: 'Pan/Focus Pull on Unique Feature of Lobby 1',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate: '24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby,
                                    description: 'Pan/Focus Pull on Unique Feature of Lobby 2',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate: '24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby,
                                    description: 'Pan/Focus Pull on Unique Feature of Lobby 3',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate: '24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby,
                                    description: 'Pan/Focus Pull on Unique Feature of Lobby 4',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate: '24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)


hotel_video_group_lobby_decor = TaskGroup.create!(title: 'Hotels - Lobby Decor', shoot: hotels_default_video_shoot, order: 4)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_decor,
                                    description: 'Pan/Focus Pull of Decor 1',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_decor,
                                    description: 'Pan/Focus Pull of Decor 2',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_decor,
                                    description: 'Pan/Focus Pull of Decor 3',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_decor,
                                    description: 'Pan/Focus Pull of Decor 4',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_decor,
                                    description: 'Pan/Focus Pull of Decor 5',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_decor,
                                    description: 'Pan/Focus Pull of Decor 6',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

hotel_video_group_lobby_ammenities = TaskGroup.create!(title: 'Hotels - Ammentity 1', shoot: hotels_default_video_shoot, order: 5)


ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 1 - Walkthrough',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 1 - Focus Pull On title of ammentity',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type:"video",
                                     frame_rate:"24.4 - Regular Speed",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 1 - Details Motion of cool feature - Shot 1',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 1 - Details Motion of cool feature - Shot 2',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 1 - Details Motion of cool feature - Shot 3',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 1 - Drone with dramatic size change',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 1 - Action with relevant propo for the amenity (towel for pool, yoga mat for studio, etc...)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

hotel_video_group_lobby_ammenities = TaskGroup.create!(title: 'Hotels - Ammentity 2', shoot: hotels_default_video_shoot, order: 6)
ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 2 - Walkthrough',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 2 - Focus Pull On title of ammentity',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type:"video",
                                     frame_rate:"24.4 - Regular Speed",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 2 - Details Motion of cool feature - Shot 1',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 2 - Details Motion of cool feature - Shot 2',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 2 - Details Motion of cool feature - Shot 3',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 2 - Drone with dramatic size change',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 2 - Action with relevant propo for the amenity (towel for pool, yoga mat for studio, etc...)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

hotel_video_group_lobby_ammenities = TaskGroup.create!(title: 'Hotels - Ammentity 3', shoot: hotels_default_video_shoot, order: 7)


ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 3 - Walkthrough',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 3 - Focus Pull On title of ammentity',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type:"video",
                                     frame_rate:"24.4 - Regular Speed",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 3 - Details Motion of cool feature - Shot 1',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 3 - Details Motion of cool feature - Shot 2',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 3 - Details Motion of cool feature - Shot 3',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 3 - Drone with dramatic size change',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 3 - Action with relevant propo for the amenity (towel for pool, yoga mat for studio, etc...)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

hotel_video_group_lobby_ammenities = TaskGroup.create!(title: 'Hotels - Ammentity 4', shoot: hotels_default_video_shoot, order: 8)


ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 4 - Walkthrough',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 4 - Focus Pull On title of ammentity',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type:"video",
                                     frame_rate:"24.4 - Regular Speed",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 4 - Details Motion of cool feature - Shot 1',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 4 - Details Motion of cool feature - Shot 2',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 4 - Details Motion of cool feature - Shot 3',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 4 - Drone with dramatic size change',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Amenity 4 - Action with relevant propo for the amenity (towel for pool, yoga mat for studio, etc...)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


hotel_video_group_lobby_guest_room = TaskGroup.create!(title: 'Hotels - Guest Room 1', shoot: hotels_default_video_shoot, order: 9)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (small) - Walk In with arc (stay out of mirrors)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (small) - Walk In into bathroom with arc (stay out of mirrors)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (small) - Walk out of bathroom into room with arc (stay out of mirrors)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)


ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Guest Room (small) - Open the closet',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)


ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (small) - View to the windows (hold long enough for the camera to correct)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (small) - Motion on unique feature',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (small) - Motion on unique feature (no center, feature takes up less than 50% of frame)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)


ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (small) - Close up of sheets and pillows',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)

hotel_video_group_lobby_guest_room = TaskGroup.create!(title: 'Hotels - Guest Room 2', shoot: hotels_default_video_shoot, order: 9)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (medium) - Walk In with arc (stay out of mirrors)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (medium) - Walk In into bathroom with arc (stay out of mirrors)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (medium) - Walk out of bathroom into room with arc (stay out of mirrors)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)


ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Guest Room (medium) - Open the closet',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)


ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (medium) - View to the windows (hold long enough for the camera to correct)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (medium) - Motion on unique feature',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (medium) - Motion on unique feature (no center, feature takes up less than 50% of frame)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)


ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (medium) - Close up of sheets and pillows',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)


hotel_video_group_lobby_guest_room = TaskGroup.create!(title: 'Hotels - Guest Room 2', shoot: hotels_default_video_shoot, order: 9)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - Walk In with arc (stay out of mirrors)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - Walk In into bathroom with arc (stay out of mirrors)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - Walk out of bathroom into room with arc (stay out of mirrors)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)


ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_ammenities,
                                    description: 'Guest Room (large) - Open the closet',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)


ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - View to the windows (hold long enough for the camera to correct)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - Motion on unique feature',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - Motion on unique feature (no center, feature takes up less than 50% of frame)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)


ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - Close up of sheets and pillows',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id:@zack_admin.id)



hotel_video_group_lobby_guest_room = TaskGroup.create!(title: 'Hotels - Guest Room 3', shoot: hotels_default_video_shoot, order: 9)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - Walk In with arc (stay out of mirrors)',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - Walk In into bathroom with arc (stay out of mirrors)',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - Walk out of bathroom into room with arc (stay out of mirrors)',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - Open the closet',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - View to the windows (hold long enough for the camera to correct)',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - Close up of sheets and pillows',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - Motion on unique feature',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - Motion on unique feature (no center, feature takes up less than 50% of frame)',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id:@zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_lobby_guest_room,
                                    description: 'Guest Room (large) - Motion on 2nd unique feature (no center, feature takes up less than 50% of frame)',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id:@zack_admin.id)


hotel_video_group_trans_local_product = TaskGroup.create!(title: 'Translocal 1', shoot: hotels_default_video_shoot, order: 13)
ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 1 - zoom in - inside the hotel',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 1 - focus pull on product logo',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 1 - Still of finished product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 1 - Still shot of product in use (focus left or right for text on other side)',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 1 - Pan of product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 1 - Pullback establishing showcasing the hotel in background',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 1 - Top Down shot action if possible',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


hotel_video_group_trans_local_product = TaskGroup.create!(title: 'Translocal 2', shoot: hotels_default_video_shoot, order: 13)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 2 - zoom in - inside the hotel',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 2 - focus pull on product logo',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 2 - Still of finished product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 2 - Still shot of product in use (focus left or right for text on other side)',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 2 - Pan of product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 2 - Pullback establishing showcasing the hotel in background',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 2 - Top Down shot action if possible',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

hotel_video_group_trans_local_product = TaskGroup.create!(title: 'Translocal 3', shoot: hotels_default_video_shoot, order: 13)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 3 - zoom in - inside the hotel',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 3 - focus pull on product logo',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 3 - Still of finished product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 3 - Still shot of product in use (focus left or right for text on other side)',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 3 - Pan of product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 3 - Pullback establishing showcasing the hotel in background',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 3 - Top Down shot action if possible',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

hotel_video_group_trans_local_product = TaskGroup.create!(title: 'Translocal 4', shoot: hotels_default_video_shoot, order: 13)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 4 - zoom in - inside the hotel',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 4 - focus pull on product logo',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 4 - Still of finished product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 4 - Still shot of product in use (focus left or right for text on other side)',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 4 - Pan of product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 4 - Pullback establishing showcasing the hotel in background',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_trans_local_product,
                                    description: 'Local Product 4 - Top Down shot action if possible',
                                    aspect_ratio:'landscape',
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:"24.4 - Regular Speed",
                                    added_by_id: @zack_admin.id)


hotel_video_group_guest_experience = TaskGroup.create!(title: 'Guest Experience - Check In', shoot: hotels_default_video_shoot, order: 17)
ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience Check in - Waking in front door from most interesting side',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience Check in - Guest at desk handing something to employee',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience Check in - Valet putting luggage on the cart',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience Check in - Guest gets a Key or Folio from Desk Clerk (Logo out to camera - Tight shot on hands)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience Check in - Smiling guest and receptionist',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience Check in - Waiting in seating area (possibly working)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience Checkin - Taking a call laughing (no audio) mouthing <We have just arrived, its beautiful>',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience Check In - Talent walking to elevator with no luggage',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

hotel_video_group_guest_experience = TaskGroup.create!(title: 'Guest Experience', shoot: hotels_default_video_shoot, order: 18)
ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience  Guest Experience - Talent enters elevator and touches button (talent turns around looks through door, door closes)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience  Guest Experience - Close up of button press (always use the top floor)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience  Guest Experience - Enter room (talent walks into frame and enters room, camera follows)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience  Guest Experience - Slow motion trust Falling back onto bed',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience  Guest Experience - Slow motion side angle of head hitting pillow',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience  Guest Experience with Vibe - Meal 1',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Guest Experience  Guest Experience with Vibe - Meal 2',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)


hotel_video_group_guest_experience = TaskGroup.create!(title: 'Guest Experience - Bar', shoot: hotels_default_video_shoot, order: 19)
ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Bar - Establishing shot,',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Bar - Pan down length of bar (some action, wiping a glass, smiles, etc)',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Bar - Pouring a drink 1',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Bar - Pouring a drink 2',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Bar - Pouring a beer',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Bar - mixing a drink 1',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Bar - Scooping Ice',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Bar - Overhead shot of finished drink on branded napkin, not in center',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Bar - close up of ingredients',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Bar - Close Up of presentation of drink.',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_guest_experience,
                                    description: 'Bar - Cheers shot with motion.',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

hotel_video_group_restaurant = TaskGroup.create!(title: 'Restaurant Showcase', shoot: hotels_default_video_shoot, order: 19)
ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Walking up to hostess stand',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Viewpoint of hostess guests walking up',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Talent sitting down at well lit table',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Talent Lookin over menu',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Focus Pull in with logo on menu',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Focus pull out with logo on menu',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Follow waitstaff carrying food to table',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - waitstaff placing food on table',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - waitstaff pouring glass of wine',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Talent enjoying food 1',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Talent enjoying food 2',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Talent enjoying food 3',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Talent absurdly enjoying the experience',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Chef prep with flames',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Chef cutting something',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Arc of best presented food 1',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Arc of best presented food 2',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Arc of best presented food 3',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Restaurant - Food Steaming',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate:'24.4 - Regular Speed',
                                    added_by_id: @zack_admin.id)


hotel_video_group_staff = TaskGroup.create!(title: 'Staff Showcase', shoot: hotels_default_video_shoot, order: 19)
ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Staff Member 1 - center in frame 120 FPS Pull away',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate: '120 - Super Slow',
                                    added_by_id: @zack_admin.id)
ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Staff Member 2 - center in frame 120 FPS Pull away',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate: '120 - Super Slow',
                                    added_by_id: @zack_admin.id)
ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Staff Member 3 - center in frame 120 FPS Pull away',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate: '120 - Super Slow',
                                    added_by_id: @zack_admin.id)
ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Staff Member 4 - center in frame 120 FPS Pull away',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate: '120 - Super Slow',
                                    added_by_id: @zack_admin.id)
ShotListItem.create!(shoot: hotels_default_video_shoot,
                                    task_group: hotel_video_group_restaurant,
                                    description: 'Staff Member 5 - center in frame 120 FPS Pull away',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:"video",
                                    frame_rate: '120 - Super Slow',
                                    added_by_id: @zack_admin.id)
p "----------- Package Type Hotels - Video Shot List Items Completed  ----------"

p "----------- Package Type Hotels - Photo Shot List Items   ----------"
hotel_photo_group_exterior = TaskGroup.create!(title: 'Hotel Exterior', shoot: hotels_default_photo_shoot, order: 1)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'Establishing Shot - Neighborhood,',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'Establishing shot - Exterior Building (All sides)',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'Establishing shot - Drone Shot of Structure',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'Establishing Shot - hover',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'Establishing shot - dramatic angle of structure',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'Establishing shot - Drone Diagonal shot',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'Wide shot -',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'mid shot',
                                      aspect_ratio:"landscape",
                                      background:"on site",
                                      focus_point: "center",
                                      item_type: "photo",
                                      added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'Mid action shot of entranceway action. Cars pulling up or valet/bellhop',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'Details shots of - Branded signage, main lit logo, unique facade elements',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'Wide shot of unique facade elements',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "right",
                                     item_type:  "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'Logo - dead on off center (either right or left side)',
                                     aspect_ratio:"portrait",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type:  "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'Logo - dead on off center (either right or left side)',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'elevated shot of hotel',
                                      aspect_ratio:"landscape",
                                      background:"on site",
                                      focus_point: "center",
                                      item_type: "photo",
                                      added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'entrance.',
                                     aspect_ratio:"landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'Building Exterior - Night Time Extended exposure (sun flare if possible)',
                                      aspect_ratio:"landscape",
                                      background:"on site",
                                      focus_point: "center",
                                      item_type: "photo",
                                      added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_exterior,
                                    description: 'Focus Pull from cafe or street sign with a building reveal',
                                      aspect_ratio:"landscape",
                                      background:"on site",
                                      focus_point: "center",
                                      item_type: "photo",
                                      added_by_id: @zack_admin.id)

hotel_photo_group_neighborhood = TaskGroup.create!(title: 'Hotel Neighborhood', shoot: hotels_default_photo_shoot, order: 2)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_neighborhood,
                                    description: 'Neighborhood Shot 1',
                                     aspect_ratio: "landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_neighborhood,
                                    description: 'Neighborhood Shot 2',
                                     aspect_ratio: "portrait",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type:  "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_neighborhood,
                                    description: 'Neighborhood Shot 3',
                                     aspect_ratio: "landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_neighborhood,
                                    description: 'Neighborhood Shot 4',
                                     aspect_ratio: "landscape",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type: "photo",
                                     added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_neighborhood,
                                    description: 'Neighborhood Shot 5',
                                     aspect_ratio: "portrait",
                                     background:"on site",
                                     focus_point: "center",
                                     item_type:  "photo",
                                     added_by_id: @zack_admin.id)

hotel_photo_group_lobby = TaskGroup.create!(title: 'Hotel Lobby', shoot: hotels_default_photo_shoot, order: 3)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Lobby - Straight shot',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Lobby - Tight shot of the welcome area or concierge (exclude any papers or computers)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Lobby - From Reception looking toward guest entry',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Lobby - from front door to front desk',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Lobby - from front door to concierge',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Lobby - from waiting area to the door',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Lobby - Walking arc',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Lobby - wide lobby side 1',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Lobby - wide lobby side 2',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Lobby to elevator.',
                                    aspect_ratio:"landscape",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type:"photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Bar or Restaurant',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Lobby to Eating area',
                                    aspect_ratio: "landscape",
                                    background:"on site",
                                    focus_point: 'center',
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Action of eating area.',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: 'center',
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Unique Feature of Lobby 1',
                                    aspect_ratio: "landscape",
                                    background: "on site ",
                                    focus_point: 'center',
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Unique Feature of Lobby 2',
                                    aspect_ratio: "landscape",
                                    background: "on site ",
                                    focus_point: 'center',
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Unique Feature of Lobby 3',
                                    aspect_ratio: "portrait",
                                    background:" on site   ",
                                    focus_point: "center",
                                    item_type:"photo",
                                    added_by_id: @zack_admin.id)


ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_lobby,
                                    description: 'Unique Feature of Lobby 4',
                                    aspect_ratio: "landscape",
                                    background: "on site ",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)


hotel_photo_group_decor = TaskGroup.create!(title: 'Hotel Decor', shoot: hotels_default_photo_shoot, order: 4)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_decor,
                                    description: 'Decor 1',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_decor,
                                    description: 'Decor 2',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_decor,
                                    description: 'Decor 3',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:  "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_decor,
                                    description: 'Decor 4',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_decor,
                                    description: 'Decor 5',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_decor,
                                    description: 'Decor 6',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:  "photo",
                                    added_by_id: @zack_admin.id)

hotel_photo_group_amenity = TaskGroup.create!(title: 'Amenity 1', shoot: hotels_default_photo_shoot, order: 5)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_decor,
                                    description: 'Amenity 1 - Walkthrough',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_decor,
                                    description: 'Amenity 1 - Focus Pull On title of ammentity',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_decor,
                                    description: 'Amenity 1 - cool feature - Shot 1',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_decor,
                                    description: 'Amenity 1 - cool feature - Shot 2',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_decor,
                                    description: 'Amenity 1 - cool feature - Shot 3',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_decor,
                                    description: 'Amenity 1 - super wide',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_decor,
                                    description: 'Amenity 1 - Action with relevant propo for the amenity (towel for pool, yoga mat for studio, etc...)',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

hotel_photo_group_amenity = TaskGroup.create!(title: 'Amenity 2', shoot: hotels_default_photo_shoot, order: 5)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 2 - Walkthrough',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 2 - Focus Pull On title of ammentity',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 2 - cool feature - Shot 1',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 2 - cool feature - Shot 2',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 2 - cool feature - Shot 3',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 2 - super wide',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 2 - Action with relevant propo for the amenity (towel for pool, yoga mat for studio, etc...)',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

hotel_photo_group_amenity = TaskGroup.create!(title: 'Amenity 3', shoot: hotels_default_photo_shoot, order: 5)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 3 - Walkthrough',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 3 - Focus Pull On title of ammentity',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 3 - cool feature - Shot 1',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 3 - cool feature - Shot 2',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 3 - cool feature - Shot 3',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 3 - super wide',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 3 - Action with relevant propo for the amenity (towel for pool, yoga mat for studio, etc...)',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

hotel_photo_group_amenity = TaskGroup.create!(title: 'Amenity 4', shoot: hotels_default_photo_shoot, order: 5)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 4 - Walkthrough',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 4 - Focus Pull On title of ammentity',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 4 - cool feature - Shot 1',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 4 - cool feature - Shot 2',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 4 - cool feature - Shot 3',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 4 - super wide',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_amenity,
                                    description: 'Amenity 4 - Action with relevant propo for the amenity (towel for pool, yoga mat for studio, etc...)',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)



hotel_photo_group_guest_room = TaskGroup.create!(title: 'Guest Room (small)', shoot: hotels_default_photo_shoot, order: 5)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (small) - Walk In with arc (stay out of mirrors)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (small) - Walk In into bathroom with arc (stay out of mirrors)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (small) - Walk out of bathroom into room with arc (stay out of mirrors)',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (small) - Open the closet',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (small) - View to the windows (hold long enough for the camera to correct)',
                                    aspect_ratio:"portrait",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (small) - Motion on unique feature',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (small) - Motion on unique feature (no center, feature takes up less than 50% of frame)',
                                    aspect_ratio:"landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (small) - Close up of sheets and pillows',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

hotel_photo_group_guest_room = TaskGroup.create!(title: 'Guest Room (medium)', shoot: hotels_default_photo_shoot, order: 5)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (medium - Walk In with arc (stay out of mirrors)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (medium) - Walk In into bathroom with arc (stay out of mirrors)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (medium) - Walk out of bathroom into room with arc (stay out of mirrors)',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (medium) - Open the closet',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (medium) - View to the windows (hold long enough for the camera to correct)',
                                    aspect_ratio:"portrait",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (medium) - Motion on unique feature',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (medium) - Motion on unique feature (no center, feature takes up less than 50% of frame)',
                                    aspect_ratio:"landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (medium) - Close up of sheets and pillows',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)


hotel_photo_group_guest_room = TaskGroup.create!(title: 'Guest Room (large)', shoot: hotels_default_photo_shoot, order: 5)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (large) - Walk In with arc (stay out of mirrors)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (large) - Walk In into bathroom with arc (stay out of mirrors)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (large) - Walk out of bathroom into room with arc (stay out of mirrors)',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (large) - Open the closet',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (large) - View to the windows (hold long enough for the camera to correct)',
                                    aspect_ratio:"portrait",
                                    background:"on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (large) - Unique feature',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (large) - Unique feature 2',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (large) - Unique feature 3',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (large) - Motion on unique feature (no center, feature takes up less than 50% of frame)',
                                    aspect_ratio:"landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_guest_room,
                                    description: 'Guest Room (large) - Close up of sheets and pillows',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

hotel_photo_group_product = TaskGroup.create!(title: 'Translocal Product 1', shoot: hotels_default_photo_shoot, order: 6)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 1 - inside the hotel, dynamic placement',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 1 - focus pull on product logo',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 1 - Still of finished product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 1 - Still shot of product in use (focus left or right for text on other side)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:   "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 1 - product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 1 - Pullback establishing showcasing the hotel in background',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 1 - Top Down shot action if possible',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)


hotel_photo_group_product = TaskGroup.create!(title: 'Translocal Product 2', shoot: hotels_default_photo_shoot, order: 7)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 2 - inside the hotel, dynamic placement',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 2 - focus pull on product logo',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 2 - Still of finished product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 2 - Still shot of product in use (focus left or right for text on other side)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:   "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 2 - product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 2 - Pullback establishing showcasing the hotel in background',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 2 - Top Down shot action if possible',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)


hotel_photo_group_product = TaskGroup.create!(title: 'Translocal Product 3', shoot: hotels_default_photo_shoot, order: 8)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 3 - inside the hotel, dynamic placement',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 3 - focus pull on product logo',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 3 - Still of finished product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 3 - Still shot of product in use (focus left or right for text on other side)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:   "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 3 - product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 3 - Pullback establishing showcasing the hotel in background',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 3 - Top Down shot action if possible',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

hotel_photo_group_product = TaskGroup.create!(title: 'Translocal Product 4', shoot: hotels_default_photo_shoot, order: 9)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 4 - inside the hotel, dynamic placement',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 4 - focus pull on product logo',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 4 - Still of finished product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 4 - Still shot of product in use (focus left or right for text on other side)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:   "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 4 - product in use (if coffee show steaming coffee, if ice cream show ice cream being scooped)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 4 - Pullback establishing showcasing the hotel in background',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Local Product 4 - Top Down shot action if possible',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)


hotel_photo_group_check_in = TaskGroup.create!(title: 'Guest Experience Check in ', shoot: hotels_default_photo_shoot, order: 10)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Check in - Waking in front door from most interesting side',
                                   aspect_ratio: "landscape",
                                   background: "on site",
                                   focus_point: "center",
                                   item_type: "photo",
                                   added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Check in - Guest at desk handing something to employee',
                                   aspect_ratio: "landscape",
                                   background: "on site",
                                   focus_point: "center",
                                   item_type: "photo",
                                   added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Check in - Valet putting luggage on the cart',
                                   aspect_ratio: "landscape",
                                   background: "on site",
                                   focus_point: "center",
                                   item_type: "photo",
                                   added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Check in - Guest gets a Key or Folio from Desk Clerk (Logo out to camera - Tight shot on hands)',
                                   aspect_ratio: "landscape",
                                   background: "on site",
                                   focus_point: "center",
                                   item_type: "photo",
                                   added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Check in - Smiling guest and receptionist',
                                   aspect_ratio: "landscape",
                                   background: "on site",
                                   focus_point: "center",
                                   item_type: "photo",
                                   added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Check in - Waiting in seating area (possibly working)',
                                   aspect_ratio: "landscape",
                                   background: "on site",
                                   focus_point: "center",
                                   item_type: "photo",
                                   added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Check in - Taking a call laughing (no audio) mouthing <Weve just arrived, its beautiful>',
                                   aspect_ratio: "portrait",
                                   background: "on site",
                                   focus_point: "center",
                                   item_type:  "photo",
                                   added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_product,
                                    description: 'Check in - Talent walking to elevator with no luggage',
                                   aspect_ratio: "landscape",
                                   background: "on site",
                                   focus_point: "center",
                                   item_type: "photo",
                                   added_by_id: @zack_admin.id)


hotel_photo_group_experience = TaskGroup.create!(title: 'Guest Experience ', shoot: hotels_default_photo_shoot, order: 11)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_experience,
                                    description: 'Guest Experience - Talent enters elevator and touches button (talent turns around looks through door, door closes)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_experience,
                                    description: 'Guest Experience - Close up of button press (always use the top floor)',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:  "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_experience,
                                    description: 'Guest Experience - Enter room (talent walks into frame and enters room, camera follows)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:   "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_experience,
                                    description: 'Guest Experience - trust Falling back onto bed (rapid Fire)',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_experience,
                                    description: 'Guest Experience - side angle of head hitting pillow',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_experience,
                                    description: 'Guest Experience with Vibe - Meal 1',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:   "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_experience,
                                    description: 'Guest Experience with Vibe - Meal 2',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:   "photo",
                                    added_by_id: @zack_admin.id)

hotel_photo_group_bar = TaskGroup.create!(title: 'Bar Showcase ', shoot: hotels_default_photo_shoot, order: 12)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_bar,
                                    description: 'Establishing shot,',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_bar,
                                    description: 'down length of bar (some action, wiping a glass, smiles, etc)',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_bar,
                                    description: 'Pouring a drink 1',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_bar,
                                    description: 'Pouring a drink 2',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_bar,
                                    description: 'Pouring a beer',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_bar,
                                    description: 'mixing a drink 1',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_bar,
                                    description: 'Scooping Ice',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_bar,
                                    description: 'Overhead shot of finished drink on branded napkin, not in center',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_bar,
                                    description: 'close up of ingredients',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_bar,
                                    description: 'Close Up of presentation of drink.',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_bar,
                                    description: 'Cheers shot with motion.',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

hotel_photo_group_restaurant = TaskGroup.create!(title: 'Restaurant Showcase ', shoot: hotels_default_photo_shoot, order: 12)
ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Walking up to hostess stand',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Viewpoint of hostess guests walking up',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:  "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Talent sitting down at well lit table',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Talent Lookin over menu',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Focus logo on menu',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'wide with logo on menu',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:  "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Follow waitstaff carrying food to table front and back',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'waitstaff placing food on table top',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:  "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'waitstaff pouring glass of wine',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Talent enjoying food 1',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:  "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Talent enjoying food 2',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Talent enjoying food 3',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Talent absurdly enjoying the experience',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Chef prep with flames',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:   "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Chef cutting something',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Arc of best presented food 1',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Arc of best presented food 2',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type:  "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Arc of best presented food 3',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Food Steaming, with underlight',
                                    aspect_ratio: "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

hotel_photo_group_staff = TaskGroup.create!(title: 'Staff Showcase ', shoot: hotels_default_photo_shoot, order: 13)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Staff Member 1 - wide and left of center',
                                    aspect_ratio:  "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Staff Member 2 - wide and left of center',
                                    aspect_ratio:  "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Staff Member 3 - wide and left of center',
                                    aspect_ratio:  "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Staff Member 4 - wide and left of center',
                                    aspect_ratio:  "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Staff Member 5 - wide and left of center',
                                    aspect_ratio:  "landscape",
                                    background: "on site",
                                    focus_point: "center",
                                    item_type: "photo",
                                    added_by_id: @zack_admin.id)


hotel_photo_group_holiday = TaskGroup.create!(title: 'Holidy Showcase ', shoot: hotels_default_photo_shoot, order: 14)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Fall, with leave or branch',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "left",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Spring, with flower',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "left",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Winter, with holly',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "left",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Summer, with sunglasses',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "left",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: '4th of July, with red white and blue',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "left",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Holidays with winter sparkle',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "left",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Local with appropriate prop',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "left",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Local with appropriate prop',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "left",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Local with appropriate prop',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "left",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Local with appropriate prop',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "left",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Local with appropriate prop',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "left",
                                    added_by_id: @zack_admin.id)

ShotListItem.create!(shoot: hotels_default_photo_shoot,
                                    task_group: hotel_photo_group_restaurant,
                                    description: 'Local with appropriate prop',
                                    aspect_ratio: "portrait",
                                    background: "on site",
                                    focus_point: "left",
                                    added_by_id: @zack_admin.id)

