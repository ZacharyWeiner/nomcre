p "-----------Page Start -----------"
page = Page.create!(title: 'What Is Interactive Video?',
                    content: 'An overview of Interactive video from Nomadic Creatives view',
                    remote_header_image_url: 'https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/page/header_image/1/G0580872.jpg',
                    status: 'draft',
                    slug:'What-Is-Interactive-Video?',
                    description: nil,
                    keywords: nil)
page_section = PageSection.create!(page_id: page.id,
                                  title: 'Something else about video',
                                  content: "In the Nextflix example we just jump a few seconds ahead on the same video. But, your audience is clicking a button, and that button click can do anything we want it to. Most importantly it can load another video without refreshing the page. \r\n\r\nNow, let’s imagine what that could mean for your company. First, imagine your customers being able to self select their sales materials. Now, the customer gets to sell themselves on your product set. You seamlessly transition from speaking directly to your audience, to letting the viewer choose what’s most important to them without having to leave the video window. We’ve been shown that the less friction a user has before making a purchase, the more likely they are to pull out that wallet. \r\n\r\nSecond, you’re able to map the customers journey the way that google analytics does for web pages. The only real problem we have with tracking page flow in google, is that it doesn’t really show you which information on the page resonated with, or deterred the viewer from taking the action you want them to. Sure there are plugins to see where the users are placing their mouse, but that view is also limited in scope.\r\n\r\nWith interactive video, every section of every page on your website can become its own digestible and trackable action. It doesn’t have to go that far, but you can imagine the possibilities. \r\n\r\nTo chat with someone right now about interactive video, just click the chat window in the bottom right corner of the screen.\r\n",
                                  order: 3)

page_section = PageSection.create!(page_id: page.id,
                                  title: nil,
                                  content: "<h5> Have I Used Interactive Video Yet? </h5>\r\nInteractive video comes in a few forms. When we are narrow the list to commercial use, it basically takes two forms:\r\n\r\n<ul>\r\n<li>Added Content </li>\r\n<li>Choose Your Own Adventure</li>\r\n</ul>\r\n\r\nAdded content is the simpler example to explain. It’s like when you click a link on a website and a window pop up with more details about what you clicked. This could be as simple as a warning before deleting, or as complex as the sizing and color options of a t-shirt with various buttons to add to cart or buy now. \r\n\r\n\r\nBoth the Netflix and Hulu examples fall under the ‘Choose Your Own Adventure” experience (Hulu also does added content). The Netflix example is the most simple because your adventure just skips a few seconds like a super quick fast forward. But, chose your own adventure can become as complex as a business needs, and can play exactly the right video to walk a potential client through the funnel. \r\n",
                                  order: 1)

page_section = PageSection.create!(page_id: page.id,
                                  title: nil,
                                  content: "The example most people might recognize is from Netflix. Think about when you’re about to watch the next episode in a series. When the opening credits roll, you’re offered a button to skip the intro. If you click the button, the video jumps forward a little bit and continues playing where the intro ended. This is the most basic form of interactive video. \r\n\r\nAnother widespread example is on Hulu.If you have a package that plays commercials, sometimes they give you the option to skip them if you watch an interactive video. Then you have to click somewhere on the screen before your actual video will play. \r\n",
                                  order: 0)

p "-----------Page Complete -----------"
p "-----------Page Start -----------"
page = Page.create!(title: "2 Rules For 6 Second Videos",
                    content: "Two simple rules to follow for 6-second video ads. , remote_header_image_url: https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/page/header_image/3/DJI_0455.jpg",
                    status: "published",
                    slug: "2-Rules-For-6-Second-Videos",
                    description: nil ,
                    keywords: nil)

page_section = PageSection.create!(page_id: page.id,
                                  title: nil,
                                  content: "<h5>Two basic rules to follow with 6 second ads:</h5>\r\n<br>\r\n<b>#1</b> - Speak to your audience like they are and 8 year old. In 6 seconds, we only have the ability to digest what we see, there is no time for nuance or interpretation. \r\n<br><br>\r\n<b>#2</b> - Your message should be no longer than 9 words. From our testing at Nomcre.com, we’be found that more than 3 words every two seconds becomes hard to retain. \r\n<br><br>\r\nSome other advice we give clients from our experience: Forget about the burn in, End on an Image of your your logo, website, social, etc ... not on a fade in of each or animation. Your message should be a compelling activation statement, to substitute for a CTA. \r\n<br><br>\r\nAlso remember: The main reason 6 second ads get view rates of nearly 100% duration is that most video ad platforms don’t let you “skip” until you’ve watched at least 5 seconds. So if your ad is only 6 seconds of course people are going to see thee whole thing. If the ad is compelling, people will give it an extra 2 or 3 seconds of attention. \r\n<br><br>\r\nTo chat with a human about a 6-second ad, click the chat window in the bottom right corner of the page :)",
                                  order: 0)
p "-----------Page Complete -----------"

p "-----------Page Start -----------"
page = Page.create!(title: "How To Create Interactive Video - Part 1" ,
                    content: "Part one of a two-part blog post on creating an interactive video. , remote_header_image_url: https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/page/header_image/4/VideoStack.png",
                    status: "published",
                    slug: "How-To-Create-Interactive-Video---Part-1-",
                    description: nil,
                    keywords: nil)
page_section = PageSection.create!(page_id: page.id,
                                  title: nil,
                                  content: "<video id='video1' width=\"100%\" height=\"auto\" autoplay='false'  controls='true'>\r\n  <source src=\"https://s3-us-west-2.amazonaws.com/nomcre-rails/public-videos/Nomcre-Creator-Vid-1-sound.mp4\" type=\"video/mp4\">\r\n    Your browser does not support this type of video .\r\n  </video>\r\n  <button name=’continuePlay’ class='btn btn-primary' onclick=\"onButton1Clicked()\" >Play/Pause</button>\r\n  <button name=jumpAhead class='btn btn-warning' onclick=\"onButton2Clicked()\">Jump To 20 (s)</button>\r\n\r\n<script>\r\n  $(document).ready(function(){\r\n\r\n    $('#video1').on('loadeddata', function(){\r\n      console.log('the video is loaded');\r\n    });\r\n      $('#video1').on('timeupdate', function(){\r\n      console.log('the time is updating');\r\n    });\r\n\r\n  });\r\n\r\n  function onButton1Clicked(e){\r\n    this.toggleVideoState(e);\r\n  }\r\n\r\n  function onButton2Clicked(e){\r\n     $('#video1')[0].currentTime = 20;\r\n  }\r\n\r\n  function toggleVideoState(e){\r\n\r\n    if ($('#video1')[0].paused){\r\n      $('#video1')[0].play();\r\n    }else{\r\n      $('#video1')[0].pause();\r\n    }\r\n  }\r\n\r\n</script>",
                                  order: 5)

page_section = PageSection.create!(page_id: page.id,
                                  title: "Adding a video",
                                  content: "\r\nFor the purpose of this instruction, I will use some videos from Nomadic Creative (NOMCRE). \r\n\r\nJust above the buttons in the html, let's add an HTML video element. And since we are going to want the video to be responsive, let's do it the easy bootstrap way. \r\n<br>\r\n  <\"video\" id='video1' width=\"100%\" height=\"auto\" autoplay='true'  controls='false'><br>\r\n      <\"source\" src=\"https://s3-us-west-2.amazonaws.com/nomcre-rails/public-videos/Nomcre-Creator-Vid-1-sound.mp4\" type=\"video/mp4\"><br>\r\n      Your browser does not support this type of video .<br>\r\n  <\"/video\"><br>\r\n\r\n\r\n\r\n<br>\r\nNotice we gave the video an id of ‘video1’. At this point you should be able to reload the page and see the video. You should also be able to resize the page and see the video scale to the correct size. \r\n\r\n<br><br>\r\nNow that we have some video on the page lets add some methods to interact with the video when it loads, and when the time updates. Inside of the document ready function lets add the following event handlers: \r\n<br>\r\n\r\n\r\n/* $(document).ready(function(){*/<br>\r\n\r\n    /*$('#video1').on('loadeddata', function(){\r\n      console.log('the video is loaded');\r\n    });*/ <br>\r\n     /* $('#video1').on('timeupdate', function(){\r\n      console.log('the time is updating');\r\n    });*/ <br>\r\n\r\n  /*});\r\n*/\r\n\r\n<br> <br>\r\nAnd lets add a method to stop and start the video. <br>\r\n\r\n<br>\r\n/*\r\n  function toggleVideoState(e){\r\n\r\n    if ($('#video1')[0].paused){\r\n      alert($('#video1')[0].paused);\r\n      $('#video1')[0].play();\r\n    }else{\r\n      $('#video1')[0].pause();\r\n    }\r\n  }\r\n*/\r\n<br> <br>\r\nNow, let's apply the methods to each of the buttons clicks. <br>\r\n/*\r\n  function onButton1Clicked(e){\r\n\tfunction toggleVideoState(e);\r\n  }\r\n*/\r\n<br>\r\n/*\r\n  function onButton2Clicked(e){\r\n\t$(#video1)[0].currentTime = 20;\r\n  }\r\n*/\r\n<br><br>\r\nNow if you click the second button, the video should start to play. At this point we have created the most basic version of an interactive video. A button made purely of HTML, CSS, and JS can now interact with the video on the screen. \r\n\r\n<h2>BOOM! Interactive Video! </h2>\r\n",
                                  order: 4)

page_section = PageSection.create!(page_id: page.id,
                                  title: "Adding Some Basic Interaction",
                                  content: "First let’s check that the JQuery is loading properly. We can do that pretty easily by creating our own script tag and responding to the OnLoad Event. \r\n\r\nin a script tag let's check the document is ready:\r\n \" $(document).ready(function(){\r\n    alert('t');\r\n  });\"\r\n<br><br>\r\n\r\nOnce you see the alert, delete the line alert(‘t’);<br>\r\n\r\nNow, let's add two buttons. One will be used to continue to play, and the other will be used to jump to a new point in the video. <br>\r\n\r\nSo in the HTML Body let’s add two simple buttons. I will use some Bootstrap styling here, so assuming it’s imported correctly you should see auto styled buttons. <br><br>\r\n\r\nthe first button should have the following properties: <br> id=’continuePlay’ class='btn btn-primary' and let's add the text \"Continue\"<br><br>\r\nthe second button should have the following properties: <br> id=’pausePlay’ class='btn btn-primary' and let's add the text \"Pause\"<br>\r\n\r\n<br><br>\r\n\r\nNow let’s hook them up to some event handlers. Down in our custom script tag, but outside of the \"$(document).ready()\" function lets define some functions that we will call when the button gets clicked, and test that it works. <br>\r\n     \"$(document).ready()\"<br>\r\n     onButton1Clicked(e){\r\n        alert('continue');\r\n     }<br>\r\n    onButton2Clicked(e){\r\n        alert('jump');\r\n    }<br>\r\n\r\n<br><br>\r\nNow let’s test that it works by clicking the buttons. If you get a popup with the right info, go ahead and delete the alerts. <br>\r\n\r\nAwesome now that we are all set up with the JQuery and styles we need to get this interactive video working, lets get to the cool stuff! <br><br>\r\n",
                                  order: 3)

page_section = PageSection.create!(page_id: page.id,
                                  title: "Importing The Libraries ",
                                  content: "Importing the libraries\r\n\r\nTons of libraries are available for download, and cloudflare does a great job of making them available to us. <br><br>\r\n\r\nSo after we add JQuery and Bootstrap we will grab featherlight from the CDN. Since bootstrap relies on JQuery you just need to head over to the Bootstrap Getting Started page to find the links for the right scripts:<br><br>\r\n\r\n\r\nscript src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\" integrity=\"sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN\" crossorigin=\"anonymous\"<br><br>\r\nscript src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"<br><br>\r\nscript src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"\r\n\r\n<br><br>\r\nAnd let's drop the Bootstrap CSS into the head of the html document. \r\n<br>\r\nlink rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\"\r\n\r\n<br><br>\r\nLast let’s head over to the CDN to grab featherlight. <br>\r\nhttps://cdnjs.com/libraries/featherlight\r\n<br><br>\r\nSo we add the script at under all the other script tags:<br>\r\nscript src=\"https://cdnjs.cloudflare.com/ajax/libs/featherlight/1.7.13/featherlight.min.js\" crossorigin=\"anonymous\"\r\n<br><br>\r\nAnd add the CSS link under the Bootstrap CSS link:<br>\r\nlink rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/featherlight/1.7.13/featherlight.min.css\" crossorigin=\"anonymous\"\r\n<br><br>\r\n",
                                  order: 2)

page_section = PageSection.create!(page_id: page.id,
                                  title: "Getting Started",
                                  content: "\r\nIn this article, I am going to use a few libraries that will make the development easier for the areas that don’t focus on the ‘interactive’ part. \r\n<br><br>\r\nTo do this we will include \r\n<div class='container'>\r\n        <ul>\r\n\t<li>JQuery.js</li>\r\n\t<li>Bootstrap for css and js </li>\r\n\t<li>Featherlight.js</li>\r\n        </ul>\r\n</div>\r\n<br><br>\r\nFirst, let’s create a folder somewhere to house the project. I will call mine interactive-video-example. \r\n<br><br>\r\nNext, let’s add a basic webpage to the folder. Create a file named index.html inside interactive-video-example. If you use a mac you can jump in the terminal, navigate to the folder and enter the touch command to create an empty file. \r\n<br><br>\r\n\t<p style='background-color:gray'>$ touch index.html </p>\r\n<br><br>\r\nThen let’s add the minimum html to build a webpage (I’m assuming you all will already have some place that you want to use this, so I won’t waste time on page structure).  If you need the boilerplate you can copy it from here: https://www.w3schools.com/html/html5_intro.asp\r\n\r\n\r\n<br> \r\n\r\n",
                                  order: 1)

page_section = PageSection.create!(page_id: page.id,
                                  title: nil,
                                  content: "Before we get started let’s set some expectations. This is a how to article on building an interactive video. I am assuming you have at least minimal experience working on websites. You should be comfortable with basic HTML, Javascript (JS), JQuery, and CSS. This article will not be a tutorial on basic web dev skills. \r\n\r\nFor more information on the basics of web development I suggest starting here: https://www.codecademy.com/\r\n\r\nNow, let’s get to the good stuff! \r\n",
                                  order: 0)

p "-----------Page Complete -----------"

p "-----------Page Start -----------"
page = Page.create!(title: "2 Simple Rules to 6-Second Videos",
                    content: nil,
                    remote_header_image_url: "https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/page/header_image/6/2_Simple_Rules_-_6_Second_Video.png",
                    status: "published",
                    slug: "2-Simple-Rules-to-6-Second-Videos-",
                    description: "Simple Rules to keep in mind when making 6 second videos for your companies ads. Commercial Videography isn't easy, but nomcre is here to help you through it." ,
                    keywords: "6 second video, video ads, videography, social media, social videos, sharable videos" )
page_section = PageSection.create!(page_id: page.id,
                                  title: nil,
                                  content: "<a href='https://www.nomcre.com/pages/2-Simple-Rules-to-6-Second-Videos-#intro-brief' class='nk-btn nk-btn-x2 nk-btn-effect-5-left nk-btn-circle nk-btn-color-dark-1'> Click Here to Learn More... </a>",
                                  order: 4)

page_section = PageSection.create!(page_id: page.id,
                                  title: "Some Other Things To Remember" ,
                                  content: "The main reason 6-second ads get view rates of nearly 100% duration is that most video ad platforms don’t let you “skip” until you’ve watched at least 5 seconds. So if your ad is only 6 seconds, of course, people are going to see the whole thing. If the ad is compelling, people will give it an extra 2 or 3 seconds of attention." ,
                                  order: 4)

page_section = PageSection.create!(page_id: page.id,
                                  title: "6-Second Video Ad Rule #2",
                                  content: "Your message should be no longer than 9 words. From our testing at Nomcre.com, we’be found that more than 3 words every two seconds becomes hard to retain." ,
                                  order: 3)

page_section = PageSection.create!(page_id: page.id,
                                  title: "6-Second Video Ad Rule #1",
                                  content: "Speak to your audience like they are and 8 year old. In 6 seconds, we only have the ability to digest what we see, there is no time for nuance or interpretation." ,
                                  order: 2)

page_section = PageSection.create!(page_id: page.id,
                                  title: "2 Basic Rules For 6 Second Ads",
                                  content: "Forget about the burn-in, End on an Image of your logo, website, social, etc, not on a fade in of each or animation. Make sure to focus a message that is a compelling activation statement to substitute for a CTA. \r\n",
                                  order: 1)


p "-----------Page Complete -----------"
p "-----------Page Start -----------"
page = Page.create!(title: "Entrepreneur Magazine",
                    content: nil,
                    remote_header_image_url: "https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/page/header_image/7/DJI_0232.JPG",
                    status: "published",
                    slug: "Entrepreneur-Magazine",
                    description:" Article for Entrepreneur Magazine",
                    keywords: "Entrepreneur Magazine")
p "-----------Page Complete -----------"
p "-----------Page Start -----------"
page = Page.create!(title: "What Is Interactive Video",
                    content: "An overview of Interactive video from Nomadic Creatives view",
                    remote_header_image_url: "https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/page/header_image/2/drone_aerial-19.jpg",
                    status: "published",
                    slug: "What-Is-Interactive-Video",
                    description: "A quick down and dirty rundown of what interactive video is, and why it's important ",
                    keywords: "interactive, video, marketing, sales, lead generation, social, engagement" )

page_section = PageSection.create!(page_id: page.id,
                                  title: nil,
                                  content: "<h5> What does that mean for my business? </h5>\r\n<br>\r\n\r\nNow, let’s imagine what that could mean for your company. First, imagine your customers being able to self-select their sales materials. Now, the customer gets to sell themselves on your product set. You seamlessly transition from speaking directly to your audience, to letting the viewer choose what’s most important to them without having to leave the video window. We’ve been shown that the less friction a user has before making a purchase, the more likely they are to pull out that wallet. \r\n<br>\r\nSecond, you’re able to map the customer's journey the way that google analytics does for web pages. The only real problem we have with tracking page flow in Google is that it doesn’t really show you which information on the page resonated with, or deterred the viewer from taking the action you want them to. Sure there are plugins to see where the users are placing their mouse, but that view is also limited in scope.\r\n<br>\r\nWith interactive video, every section of every page on your website can become its own digestible and trackable action. It doesn’t have to go that far, but you can imagine the possibilities. \r\n<br>\r\n<b>To start the conversation about your next interactive video, click the chat window in the bottom right corner of the screen.</b>\r\n",
                                  order: 3)

page_section = PageSection.create!(page_id: page.id,
                                  title: nil,
                                  content: "<h5>Interactive video comes in a few forms.</h5>\r\n<br>\r\nWhen we are narrow the list to commercial use, it basically takes two forms:\r\n<div class=\"container\">\r\n<ul><li>\r\nAdded Content \t</li><li>\r\nChoose Your Own Adventure </li>\r\n</ul>\r\n</div>\r\n\t\r\nAdded content is the simpler example to explain. It’s like when you click a link on a website and a window pop up with more details about what you clicked. This could be as simple as a warning before deleting, or as complex as the sizing and color options of a t-shirt with various buttons to add to cart or buy now. \r\n\r\n\r\nBoth the Netflix and Hulu examples fall under the ‘Choose Your Own Adventure” experience (Hulu also does added content). The Netflix example is the most simple because your adventure just skips a few seconds like a super quick fast forward. But, chose your own adventure can become as complex as a business needs, and can play exactly the right video to walk a potential client through the funnel. \r\n\r\n<br>\r\n\r\nIn the Nextflix example we just jump a few seconds ahead on the same video. But, your audience is clicking a button, and that button click can do anything we want it to. Most importantly it can load another video without refreshing the page. \r\n",
                                  order: 2)

page_section = PageSection.create!(page_id: page.id,
                                  title: "What is Interactive Video?",
                                  content: "The example most people might recognize is from Netflix. Think about when you’re about to watch the next episode in a series. When the opening credits roll, you’re offered a button to skip the intro. If you click the button, the video jumps forward a little bit and continues playing where the intro ended. This is the most basic form of interactive video. \r\n\r\nAnother widespread example is on Hulu.If you have a package that plays commercials, sometimes they give you the option to skip them if you watch an interactive video. Then you have to click somewhere on the screen before your actual video will play. \r\n",
                                  order: 1)

p "-----------Page Complete -----------"

p "-----------Page Start -----------"
page = Page.create!(title: "3 Simple Tips For Social Media Success" ,
                    content: nil,
                    remote_header_image_url: "https://nomcre-rails.s3.us-west-2.amazonaws.com/uploads/page/header_image/5/drone_aerial-8.jpg",
                    status: "published",
                    slug: "3-Simple-Tips-For-Social-Media-Success-",
                    description: "Simple ways to use social media more efficiently for your business. This includes focusing on the right channels, using the right picutres & images, avoiding stock photos, and publishing authentic videos. ",
                    keywords: "social media, facebook, product photography, product videography, sharing, engagement" )

page_section = PageSection.create!(page_id: page.id,
                                  title: "Choosing The Right Visuals",
                                  content: "Another factor to consider carefully is managing which visual content is being published on each specific channel. Videos can easily see 50-100% more engagement than images, and custom branded images can engage an audience up to 243% over stock photography. The visual elements should match how your audience uses the channel. For instance, many people are on Facebook and Twitter at work, but the majority of those people are taking a break and acting as a consumer when they're scrolling. Consumers tend to prefer material that seems more authentic, like real people and real faces. Almost 100% of the users logging into LinkedIn are focused on some element of business (even when they act as consumers of job information), and business-focused visuals should always include company brandings like a logo or hashtag and must appear to be professionally. \r\n\r\n\r\nUser-Generated Content can be a source of inspiration. Although, publishing UGC to channels without adding or editing the content in someway will almost always result in an incoherent visual representation of your company that may serve to backfire diminishing trust instead of building it.",
                                  order: 3)

page_section = PageSection.create!(page_id: page.id,
                                  title: "Choosing The Right Content (doesn't have to be yours)",
                                  content: "Second to focusing on the right channels is the content that's used in cultivating the audience. It's a great practice to share information that your audience can use immediately, even if the source is not from your company. This is a very low effort objective and as long as you're not promoting a competitor, your audience will appreciate the information. As an added bonus your relationship with them will organically grow deeper, and they will inherently trust your authority more.",
                                  order: 2)

page_section = PageSection.create!(page_id: page.id,
                                  title: "Choosing The Right Channels ",
                                  content: "While everyone keeps hearing that social is integral to a sales and marketing strategy, not all channels are created equal. The most important factor in building the strategy for your company is to focus on the channels that capture your audience's attention. You probably won't be able to grow a dental implant audience on SnapChat, and you probably won't have much success growing an audience on Pinterest for a B2B service. \r\n",
                                  order: 1)
p "-----------Page Complete -----------"
