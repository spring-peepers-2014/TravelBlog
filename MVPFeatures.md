# TravelBlog MVP Features
A user can create trips

For each trip, a user can
- add location markers to the map
- create blog posts
- pin blog posts to a location marker
- view a map with all location markers
- click a location marker to see all blog posts pinned to that location

## Completed

### Home/Signup/Login
Homepage is the user sign up and login page. All URIs redirect to here if user is not logged in.
![Travel Blog Home](http://i.imgur.com/ZvCJxxy.png "Signup/Login")

## View All Trips
User can view all trips.
![Travel Blog All Trips](http://i.imgur.com/5dtEvSj.png "All Trips")

## Add Location to Trip
User can create a new trip from an AJAX input form that drops down New Trip button.
![Travel Blog All Trips](http://i.imgur.com/5dtEvSj.png "All Trips")

## Trip/All Locations For Trip
User can view a trip and all location pins created for that trip.
![Travel Blog All Locations for Trip](http://i.imgur.com/CQfsaM1.png "All Locations for Trip")

## All Blog Posts For Location Pin
User can view all blog posts associated with a specific location pin.
![Travel Blog All Posts for Trip Location](http://i.imgur.com/TXYMTVO.png "All Posts for Trip Location")

## New Blog Post For Location Pin
User can create a new blog post. The blog post is associated with a location pin upon creation which is associated with the current trip view. Location search is forgiving, all user input is translated to the geocoded object location name, and location pin uniqueness is enforced for each trip.
![Travel Blog New Post](http://i.imgur.com/geTbykS.png "New Post")

## View Blog Post
User can view a single blog post with title and body. User can create a new blog post from an AJAX input form that drops down New Post button.
![Travel Blog Post](http://i.imgur.com/oQzP8k2.png "View Post")

## In Progress
- User can view profile/account settings
- User can update profile/account settings
- User can delete account