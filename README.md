# Weather App using Flutter, Riverpod State Management and WeatherAPI

This repository contains a Flutter app that uses Riverpod State Management and the WeatherAPI to provide users with weather information. The app includes a sign-up and login screen, a homepage showing weather data, a search feature with auto-complete suggestions, a profile page for editing user information, and a settings page for logging out.
Installation

To use the Weather App, you will need to have Flutter installed on your machine, and have an API key from WeatherAPI. Once you have those set up, you can follow these steps:

  1. Clone the repository to your local machine.
  2. Navigate to the weather_app_flutter directory.
  3. Install the required dependencies using flutter pub get.
  4. Change the api key based on your key, and add your WeatherAPI API key to the file as API_KEY=<your_api_key>.
   
 ### Run the app using flutter run.

Features


#### Authentication

<p float="left">
  <img src="https://user-images.githubusercontent.com/107943097/226404009-f24eb5f3-f7bb-4603-9706-6840a3f12b2e.png" width="300" />
 <img src="https://user-images.githubusercontent.com/107943097/226406702-1c8d66d8-472d-40f5-b4ee-ddbab2dcd71d.png" width="300" />
 <img src="https://user-images.githubusercontent.com/107943097/226407282-1b28994d-665c-4990-b504-7f6dfd5fb88a.png" width="300" />
 <img src="https://user-images.githubusercontent.com/107943097/226407929-d91a6c2b-bf7d-4d05-90b4-eea7c3e1103c.png" width="300" />
 
</p>



The app includes a sign-up and login screen for users to create an account or log in if they already have one. Authentication is handled using Firebase Authentication.


#### Home Screen

<p float="left">
  <img src="https://user-images.githubusercontent.com/107943097/226408399-708616b9-0726-49c2-b956-65744b86aeb8.png" width="300" />
   <img src="https://user-images.githubusercontent.com/107943097/226408925-362dac9d-dc5f-4e44-803f-cf5ae41b7763.png" width="300" />
    <img src="https://user-images.githubusercontent.com/107943097/226409134-c262c6ab-c0fa-485f-9314-f7344f6a1a67.png" width="300" />






 


</p>



After logging in, users will be taken to the home screen where they can view weather information for various cities. The home screen also features a search button with auto-complete functionality.


#### Profile Page

Users can access their profile page from the home screen. On the profile page, they can change their name.
Settings Page

Users can access the settings page from the home screen. On the settings page, they can log out of the app.



#### Technologies Used

    Flutter
    Riverpod State Management
    WeatherAPI
    Firebase Authentication

#### Contributing

Contributions are welcome! Please see the CONTRIBUTING.md file for more information.
License

This project is licensed under the MIT License. See the LICENSE.md file for more information.
