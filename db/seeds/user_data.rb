p "------------Admin -------------"
zack_admin = User.create!(name: 'Zack Weiner', email: 'zack@nomcre.com', user_type: 'admin', role: 0, password: ENV['DEFAULT_ADMIN_PASS'], password_confirmation: ENV['DEFAULT_ADMIN_PASS'])
zack_profile = UserProfile.create!(user_id: zack_admin.id, display_name: 'Nomcre Zack')


justin_admin = User.create!(name: 'Justin Pauly', email: 'justin@nomcre.com', user_type: 'creative', role: 0, password: ENV['DEFAULT_ADMIN_PASS'], password_confirmation: ENV['DEFAULT_ADMIN_PASS'])
justin_profile = UserProfile.create!(user_id: justin_admin.id, display_name: 'Nomcre Justin')

nomcre = Company.create!(name: 'Nomadic Creative', phone: '+1-312-493-5523', website: 'https://www.nomcre.com')
zack_admin.company = nomcre
zack_admin.save!

justin_admin.company = nomcre
justin_admin.save!


p "----------- Sopah -------------"
sopha = User.create!(name: 'Sopha Kommavang',
                    email: 'info@sophamakeupartist.com',
                    password: 'password',
                    password_confirmation: 'password',
                    user_type: 'creative')
sopha_profile = UserProfile.create!(user_id: sopha.id,
                                    description: 'As a portrait and lifestyle photographer, her passion is photographing people.  The commercial work she has shot around the world speaks to here amazing sense of her subjects.  Crafting these beautiful shots into what your brand’s needs is where NOMCRE and Sopha excel.  Not to mention, she is a big production stylist and make up artist to boot.',
                                    display_name: 'Sopha Kommavang',
                                    shot_preference: ['Editorial', 'Lifestyle', 'Story', 'Lookbook'],
                                    content_type: ['Photography'])
chicago = Location.where(name: 'Chicago').first
schedule_item = ScheduleItem.create!(user: sopha,
                                     location_id: chicago.id,
                                     start_date: Date.today,
                                     end_date: Date.today + 1.year)


p "----------- mariah -------------"
mariah = User.create!(name: 'Mariah Naella',
                      email: 'contact@mariahnaella.com',
                      password: 'password',
                      password_confirmation: 'password',
                      user_type: 'creative')

mariah_profile = UserProfile.create!(user_id: mariah.id,
                                    description: 'Chicago-based photographer + creative director',
                                    display_name: 'Mariah Naella',
                                    shot_preference: ['Product', 'Lifestyle', 'Story', 'Lookbook', 'Action', 'Editorial'], content_type: ['Photography'])

chicago = Location.where(name: 'Chicago').first
schedule_item = ScheduleItem.create!(user: mariah,
                                     location_id: chicago.id,
                                     start_date: Date.today,
                                     end_date: Date.today + 1.year)

collection = Collection.create!(user_id: mariah.id, title: 'Chicago Steelwork Bridges (Oppidan Spirits)', description: 'Collection of photos for Oppidian Spirits')
collection_item = CollectionItem.create!(user_id: mariah.id,
                                        collection_id: collection.id,
                                        remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/50/Oppidan_Bridges123_web.jpg',
                                        is_header: true,
                                        item_type: 'photo')
collection_item = CollectionItem.create!(user_id: mariah.id,
                                        collection_id: collection.id,
                                        remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/51/Oppidan_Bridges133_web.jpg',
                                        is_header: false,
                                        item_type: 'photo')
collection_item = CollectionItem.create!(user_id: mariah.id,
                                        collection_id: collection.id,
                                        remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/52/Oppidan_Bridges252_web.jpg',
                                        is_header: true,
                                        item_type: 'photo')

  collection = Collection.create!(user_id: mariah.id, title: 'Food (Caviar)', description:'Collection of photos with food subjects' )
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/53/beatrix_chiapudding.jpg',
                                           is_header: true,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/54/beatrix_burrata.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/55/joes_alaskancod.jpg',
                                           is_header: false,
                                          item_type: 'photo')

  collection = Collection.create!(user_id: mariah.id, title: 'Fashion', description: 'Collection of photos with fashion subjects')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/56/lauren_sarihenna1sepia_web.jpg',
                                           is_header: true,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/58/apryl_8_web.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/59/Robdechi_Sept086.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/63/cody1.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/64/chc23.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/61/ba7.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/60/chc15.jpg',
                                           is_header: false,
                                          item_type: 'photo')

  collection = Collection.create!(user_id: mariah.id, title: 'Portraiture', description: 'Collection of photos with people as subjects')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/72/linden_adamfriedman.jpg',
                                           is_header: true,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/73/ba2.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/74/boban1.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/75/stokes1.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/76/sam3.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/77/ln.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/78/NAE04250e2sgallery.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/79/dani_2up_web.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: mariah.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/81/derek2.jpg',
                                           is_header: false,
                                          item_type: 'photo')


  p"----------- archer -------------"
  archer = User.create!(name: 'Archer',
                        email: 'archer357@gmail.com',
                        password: 'password',
                        password_confirmation: 'password',
                        user_type: 'creative')
  archer_profile = UserProfile.create!(user_id: archer.id,
                                        description: "Hawai'i Based time lapse photographer and fine art photographer." ,
                                        display_name: 'Archer',
                                        shot_preference: ['Product', 'Lifestyle', 'Story', 'Lookbook', 'Action', 'Editorial'],
                                        content_type: ['Photography', 'Videography', 'Aerial', '360 - Video', '360 - Photo'])

  maui = Location.where(name: 'Maui').first
  schedule_item = ScheduleItem.create!(user: archer,
                                       location_id: maui.id,
                                       start_date: Date.today,
                                       end_date: Date.today + 1.year)

  collection = Collection.create!(user_id: archer.id, title: "Hawai'i", description: "Collection of photos  from Hawai'i")
  collection_item = CollectionItem.create!(user_id: archer.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/89/Wailua_Falls.jpg',
                                           is_header: true,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: archer.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/138/Black_Sand.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: archer.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/139/Hamoa_Beach.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: archer.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/140/Makawao_Shooting_Star.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: archer.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/141/Veuve_Cabana.jpg',
                                           is_header: false,
                                          item_type: 'photo')


  p"----------- nick -------------"
  nick = User.create!(name: 'Nick Diagle',
                      email: 'daigle8320@gmail.com',
                      password: 'password',
                      password_confirmation: 'password',
                      user_type: 'creative')

  nick_profile = UserProfile.create!(user_id: nick.id,
                                    description: "My name is Nicholas Daigle and I’ve been doing photography/videography for about a year and a half now. Reason why i started was about three years ago I went through one of the darkest times of my life. Yes, Depression..After a year of me trying to fight this without having any drive in me to do anything but focus on my mental health I had came across a kid in Houston who introduced me to photography. I had fallen in love with it and i could finally show people what I see through my own eyes. Some of my first photos where very dark and just depressing themselves so people could see what I was going thru in life. After a while of me expressing how I felt I studied up and realized I can do more. I had gotten my first gig with Windsorsmith and got some free dress shoes from them to take some photos. About six months later I had decent portfolio so i went after MVMT. I reached out to them and they loved my work so they sent me a watch to take some photos of. Photography isn’t just about pressing a button and posting it. Its about the journey to your destination, Finding who you really are, and expressing yourself within your photos." ,
                                    display_name: 'Nick Diagle',
                                    shot_preference: ['Editorial', 'Lifestyle', 'Action'],
                                    content_type: ['Photography', 'Videography', 'Aerial'])

  denver = Location.where(name: 'Denver').first
  schedule_item = ScheduleItem.create!(user: nick,
                                       location_id: denver.id,
                                       start_date: Date.today,
                                       end_date: Date.today + 1.year)

  collection = Collection.create!(user_id: nick.id, title: 'Portfolio' , description: "Nick Diagle's Portfolio")
  collection_item = CollectionItem.create!(user_id: nick.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/277/DSC00159-2.jpg',
                                           is_header: true,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: nick.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/278/DSC00195-2.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: nick.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/280/DSC00319-2.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: nick.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/281/DSC00245-2.jpg',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: nick.id,
                                          collection_id: collection.id,
                                          remote_video_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/video/282/C0042.mp4',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: nick.id,
                                          collection_id: collection.id,
                                          remote_video_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/video/283/Waterfall.mp4',
                                           is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: nick.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/279/DSC00441.jpg',
                                          is_header: false,
                                          item_type: 'photo')



p "----------- Abe -------------"
abe = User.create!(name: 'Abraham Piña',
                  email: 'video@jabrahampina.com',
                  password: 'password',
                  password_confirmation: 'password',
                  user_type: 'creative')
abe_profile = UserProfile.create!(user_id: abe.id,
                                  description: "Cinematographer / Photographer / Video Editor / Motion Graphics Designer / \r\n\r\nGear:\r\nSony A7S ii\r\nDJI Spark\r\nDJI OSMO 4K\r\n",
                                  display_name: "J. Abraham Piña",
                                  shot_preference: ['Product', 'Lifestyle', 'Story', 'Lookbook', 'Action', 'Editorial'],
                                  content_type: ['Photography', 'deography', 'Aerial'])


schedule_item = ScheduleItem.create!(user: abe,
                                     location_id: chicago.id,
                                     start_date: Date.today,
                                     end_date: Date.today + 1.year)

collection = Collection.create!(user_id: abe.id, title: 'Commercials / Promos', description: 'Collection of commercial works')
collection_item = CollectionItem.create!(user_id: abe.id,
                                        collection_id: collection.id,
                                        remote_video_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/video/85/DADDY_BEARDS_2017.mp4',
                                        is_header: false,
                                        item_type: 'photo')

collection_item = CollectionItem.create!(user_id: abe.id,
                                        collection_id: collection.id,
                                        remote_video_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/video/85/DADDY_BEARDS_2017.mp4',
                                        is_header: false,
                                        item_type: 'photo')




  p "----------- Dylan -------------"
  dylan = User.create!(name: 'Dylan Blumenstein',
                      email: 'blumensteindylan@gmail.com',
                      password: 'password',
                      password_confirmation: 'password',
                      user_type: 'creative')
  dylan_profile = UserProfile.create!(user_id: dylan.id,
                                    description: 'Born and raised in Wisconsin.' ,
                                    display_name: 'Dylan Blumenstein',
                                    shot_preference: ['Product', 'Lifestyle', 'Story', 'Lookbook', 'Action', 'Editorial'],
                                    content_type: ['Photography', 'Videography'])


  schedule_item = ScheduleItem.create!(user: dylan,
                                       location_id: chicago.id,
                                       start_date: Date.today,
                                       end_date: Date.today + 1.year)

  collection = Collection.create!(user_id: dylan.id, title: 'Dylan Blumenstein', description: 'Collection of work from Dylan')
  collection_item = CollectionItem.create!(user_id: dylan.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/273/fullsizeoutput_2.jpeg',
                                          is_header: true,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: dylan.id,
                                          collection_id: collection.id,
                                          remote_video_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/video/274/3_Sheeps_Beer.mp4',
                                          is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: dylan.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/275/IMG_1864-2.jpg',
                                          is_header: false,
                                          item_type: 'photo')
  collection_item = CollectionItem.create!(user_id: dylan.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/276/123.jpg',
                                          is_header: false,
                                          item_type: 'photo')


  "----------- Alexandra -------------"
  alex = User.create!(name: 'Alexandra Martin',
                      email: 'alexandra.martin@me.com',
                      password: 'password',
                      password_confirmation: 'password',
                      user_type: 'creative')
  alex_profile = UserProfile.create!(user_id: alex.id,
                                    description: "I grew up amid the natural beauty and texture of the Canadian Rockies and moved to inspiring cities like Boston, Santa Barbara, Los Angeles and New York City while traveling the globe. In 2017, I left my career in television to pursue photography, film, and content creation full time for a travel startup. In the last year, I've travelled to over 16 countries around the world, creating original content through creative storytelling.  Everywhere I go, I see a unique story and I'm compelled to capture it. Thank you for taking a ride on my journey and a peek into what I see through my lens.",
                                    display_name: 'Alexandra Martin',
                                    shot_preference: ['Product', 'Lifestyle', 'Lookbook', 'Editorial'],
                                    content_type: ['Photography', 'Videography', 'Aerial'])

  north_america = Location.where(name: 'North America').first
  schedule_item = ScheduleItem.create!(user: alex,
                                       location_id: maui.id,
                                       start_date: Date.today,
                                       end_date: Date.today + 1.year)

  collection = Collection.create!(user_id: alex.id, title: 'TRAVEL', description: 'Collection of photos from around the world')
  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/149/4Z0A0166_copy.jpg',
                                          is_header: true,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/150/4Z0A0736_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/151/4Z0A0785_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/152/4Z0A0825_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/153/4Z0A0853_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/155/4Z0A1255_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/154/4Z0A1194_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/156/4Z0A2440_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/158/4Z0A4481-2_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/160/4Z0A6853.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/162/4Z0A8953_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/164/DJI_0012_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/166/DJI_0016_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/168/DJI_0042_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/170/HIKE_DRONE-2_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_video_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/video/171/ANDY_MULTI_LOCATION_AD2_COLOUR.mp4' ,
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/157/4Z0A4089_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/159/4Z0A6634.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/161/4Z0A7480_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/163/DJI_0008.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/165/DJI_0015_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/167/DJI_0026_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/169/DJI_0050_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_video_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/video/171/ANDY_MULTI_LOCATION_AD2_COLOUR.mp4' ,
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_video_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/video/173/DEST_BARCELONA_V5_FBShort.mp4"',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_video_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/video/212/WYCO_FBAD1_V2.mp4',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_video_url:  'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/video/213/WYCO_FBAD1_V2.mp4',
                                          is_header: false,
                                          item_type: 'photo')




  collection = Collection.create!(user_id: alex.id, title: 'PEOPLE & PRODUCTS', description: 'Collection of photos with people or products')
  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/174/4Z0A0304.jpg',
                                          is_header: true,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/176/4Z0A0444_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/177/4Z0A0643_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/179/4Z0A0815_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/181/4Z0A1179_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/183/4Z0A1476_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/185/4Z0A2623_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/187/4Z0A2997_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/189/4Z0A3991_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/191/4Z0A4499.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/193/4Z0A4848_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/195/4Z0A6642.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/197/4Z0A7618_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/199/4Z0A8395_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/201/4Z0A8798_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/203/4Z0A9423_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/211/WALL-6_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/209/GDE-18_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/207/CHEFCHAOUEN-3_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/205/4Z0A9748_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/175/4Z0A0402_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/178/4Z0A0700_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/180/4Z0A0829_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/182/4Z0A1388_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/184/4Z0A2311_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/186/4Z0A2902_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/188/4Z0A3869.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/190/4Z0A3996_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/192/4Z0A4546-2_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/194/4Z0A5127_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/196/4Z0A7186.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/198/4Z0A7856.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/200/4Z0A8342_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/202/4Z0A9434.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/204/4Z0A9555_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/210/WALL-4_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/208/DJI_0007_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/206/4Z0A9965-2_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: alex.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/214/4Z0A3852_copy.jpg',
                                          is_header: false,
                                          item_type: 'photo')



  justin = justin_admin

  schedule_item = ScheduleItem.create!(user: justin,
                                       location_id: chicago.id,
                                       start_date: Date.today,
                                       end_date: Date.today + 1.year)
  collection = Collection.create!(user_id: justin.id, title: 'Main Photo Portfolio' , description: 'Collection of photos')
  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/215/4Z0A1702__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/216/DSC00707__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/146/openerImage.png',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/217/w-1337.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/218/DSC00936.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/219/FullRender-368.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/220/DSC00087.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/221/DSC01745.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/222/IMG_1229.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/223/DSC00184.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/224/DSC00908.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/225/w-961.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/226/DSC04026.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/227/w-1178.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/228/w-361.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/229/DSC02074.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/230/IMG_5990__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/231/DSC06115__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/232/IMG_6749.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/233/DSC00708__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/234/DSC05292.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/235/Homepage-1.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/236/DSC02260.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/237/DSC07984.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/238/DSC07121.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/239/Version_2__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/240/Homepage2-1.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/241/IMG_7444__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/242/DSC04092__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/243/DSC04258.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/244/DSC06297__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/245/Canyone-12.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/246/DSC01284.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/247/IMG_2613__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/248/G0010089.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/249/DSC05190.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/250/IMG_4136__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/251/IMG_0889.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/252/DSC08568.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/253/DSC02549.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/254/DSC05414__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/255/DSC05513__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/256/DSC04646__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/257/FullRender-89.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/258/w-899.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/259/DSC04111__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/260/DSC00497.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/261/DSC00033.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/262/Canyone-10.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/263/DSC04781__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/264/DSC04498.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/265/DSC02926__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/266/IMG_3304.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/267/DSC02452.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/269/DSC02471.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/270/DSC00878.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/271/DSC02633.jpg',
                                          is_header: false,
                                          item_type: 'photo')

  collection_item = CollectionItem.create!(user_id: justin.id,
                                          collection_id: collection.id,
                                          remote_file_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/collection_item/file/272/DSC04731__1_.jpg',
                                          is_header: false,
                                          item_type: 'photo')

