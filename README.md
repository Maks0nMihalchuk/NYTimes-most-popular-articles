# NYTimes-most-popular-articles


NYTimes-most-popular-articles is a test task for the position of Junior iOS developer. The application is written in the Swift language using the MVP-C architecture. The application uses the external library Alamofire `version 5.6.0`, installed via SPM, as well as the CoreData framework for saving data locally.

The main task of the application is to request, receive and display data from the public API - [The New York Times Developer Network](https://developer.nytimes.com/), namely the [Most Popular](https://developer.nytimes.com/docs/most-popular-product/1/overview) section. 

As a basis for displaying data, UITabBarController is used, which contains four screens with different data. All tabs for displaying data are using UITableView.

## Most Popular Articles Screens

1. **Most Emailed Screen** - Displays popular articles on [NYTimes](https://www.nytimes.com/) that have been emailed.
2. **Most Shared Screen** - Displays the popular articles on [NYTimes](https://www.nytimes.com/) that have been shared the most by users.
3. **Most Viewed Screen** - Displays the most viewed articles on [NYTimes](https://www.nytimes.com/).
  
An example screen is shown below.
  
 ![Most Emailed, Most Shared, Most Viewed Screens](https://user-images.githubusercontent.com/61950177/218478960-654c9058-a27c-48e9-9a5f-f7e5d131c71e.gif)

## Favorite Articles Screen

1. **Favorites screen** - displays the articles that the user has added to favorites. Such articles are stored in local storage using CoreData.

An example favorites screen with placeholder

![Favorites Screen with placeholder](https://user-images.githubusercontent.com/61950177/218481073-5651f8b6-6b33-484c-b52b-c99b1716fe9c.gif)

An example favorites screen without placeholder

![Favorites Screen without placeholder](https://user-images.githubusercontent.com/61950177/218482161-d442ecdd-34f0-4c8a-a027-8fe976c65335.gif)

## Article Details Screen

Clicking on an article opens a detailed information screen. An example screen is shown below.

![Article details screen with picture](https://user-images.githubusercontent.com/61950177/218487063-f295dab0-f5e6-4511-99b0-3842491fe36e.gif)


Also, if the article does not have an image, then a placeholder is displayed, as in the screenshot below.

![article detail screen with placeholder](https://user-images.githubusercontent.com/61950177/218487670-e1cc1fc3-964b-47a0-9539-eda3ad423d26.gif)
