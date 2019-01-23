#TODO: Fill Out With Justin


#PackageType - Excitement
#PackageType - PropertyManagement
#PackageType - ProductLaunch
#PackageType - Credibility
#PackageType - SinglePhotoShoot
#PackageType - SingleVideoShoot

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
                                 call_to_action_text: "Create Some Excitement Now!")

#Project - Excitement - Default Template
excitement_default_project = Project.create!(package_type_id: excitement.id,
                                     company_id: 1,
                                     title: "Excitement Package Project - Default Template",
                                     brief: 'Paste your creative brief here, or call us to help create one.',
                                     deadline: Date.today + 60.days,
                                     price: excitement.price,
                                     is_complete: false,
                                     max_user_shot_list: 25,
                                     is_template: true,
                                     is_default_template: true)
#Project - PropertyManagement - Default Template
#Project - ProductLaunch - Default Template
#Project - Credibility - Default Template
#Project - SinglePhotoShoot - Default Template
#Project - SingleVideoShoot - Default Template

#Shoots - Excitement - Default Template
excitement_default_photo = Shoot.create(project_id: excitement_default_project,
                                        company_id: 1,
                                        location_id: 111,
                                        content_type: ContentType.photo,
                                        breif: excitement_default_project.brief,
                                        price: 3500,
                                        shoot_style: ShootStyle.mixed)

excitement_default_video = Shoot.create(project_id: excitement_default_project,
                                        company_id: 1,
                                        location_id: 111,
                                        content_type: ContentType.video,
                                        breif: excitement_default_project.brief,
                                        price: 8500,
                                        shoot_style: ShootStyle.mixed)



#Shoots - PropertyManagement - Default Template
#Shoots - ProductLaunch - Default Template
#Shoots - Credibility - Default Template
#Shoots - SinglePhotoShoot - Default Template
#Shoots - SingleVideoShoot - Default Template

#ShotList - Excitement - Default Template

excitement_photo_1 = ShotLitsItem.create!(shoot: ,
                                         description: 'Sun (light) shining through person/feture',
                                         aspect_ratio: 'portrait',
                                         background: ,
                                         item_type: 'photo',
                                         focus_point: ,

                                         added_by: zack_admin)

Excitement - 1     portait     on set  best practices  brief   photo
Excitement - 1  Flared out staged imagery       on set  best practices  brief   photo
Excitement - 1  hero shot of person/feature low angle       on set  best practices  brief   photo
Excitement - 1  hero shot of person/feature high angle      on set  best practices  brief   photo
Excitement - 1  hero shot of person/feature tight angle     on set  best practices  brief   photo
Excitement - 1  hero shot of person/feature wide angle      on set  best practices  brief   photo
Excitement - 1  Smiling interaction         on set  best practices  brief   photo
Excitement - 1  multiples for motion for overlay/sequence       on set  best practices  brief   photo
Excitement - 1  Shot with hands up or jumping       on set  best practices  brief   photo
Excitement - 1  moment of reflection with positive mood     on set  best practices  brief   photo
Excitement - 1  use of reflection on person/feature     on set  best practices  brief   photo
Excitement - 1  use of shadow on person/feature         on set  best practices  brief   photo
Excitement - 1  shot of person/feature taking ownership         on set  best practices  brief   photo
Excitement - 1  multiple people interacting with person/feature low     on set  best practices  brief   photo
Excitement - 1  multiple people interacting with person/feature high        on set  best practices  brief   photo
Excitement - 1  multiple people interacting with person/feature tight       on set  best practices  brief   photo
Excitement - 1  multiple people interacting with person/feature wide        on set  best practices  brief   photo
Excitement - 1  celebration solo        on set  best practices  brief   photo
Excitement - 1  celebration collabrative        on set  best practices  brief   photo
Excitement - 1  celebration collabrative wide       on set  best practices  brief   photo
Excitement - 1  eyes on person/feature      on set  best practices  brief   photo
Excitement - 1  captive audience (people or items)      on set  best practices  brief   photo
Excitement - 1  Straight shot of person/feature     on set  best practices  brief   photo
Excitement - 1  Straight shot of person/feature wide        on set  best practices  brief   photo
Excitement - 1  Straight shot of person/feature mid     on set  best practices  brief   photo
Excitement - 1  Straight shot of person/feature low     on set  best practices  brief   photo
Excitement - 1  Straight shot of person/feature tight       on set  best practices  brief   photo
Excitement - 1  Angle shot of person/feature        on set  best practices  brief   photo
Excitement - 1  Angle shot of person/feature low        on set  best practices  brief   photo
Excitement - 1  Angle shot of person/feature wide       on set  best practices  brief   photo
Excitement - 1  Angle shot of person/feature tight      on set  best practices  brief   photo
Excitement - 1  Angle shot of person/feature mid        on set  best practices  brief   photo
Excitement - 1  Angle shot of person/feature high       on set  best practices  brief   photo
Excitement - 1  Establishing shot of person/feature     on set  best practices  brief   photo
Excitement - 1  Establishing shot of person/feature low     on set  best practices  brief   photo
Excitement - 1  Establishing shot of person/feature mid     on set  best practices  brief   photo
Excitement - 1  Establishing shot of person/feature high        on set  best practices  brief   photo
Excitement - 1  action shot mid     on set  best practices  brief   photo
Excitement - 1  action shot tight       on set  best practices  brief   photo
Excitement - 1  action shot wide        on set  best practices  brief   photo

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
