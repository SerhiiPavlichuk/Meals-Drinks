<!-- PROJECT LOGO -->

  <p align="center">
    This is a graduation project for completing a IOS course by <a href="https://web-academy.ua/"> Web-Academy</a>
  </p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About The Project](#about-the-project)
* [Features](#features)
* [Technologies Used](#technologies-used)
* [Privacy Policy](PrivacyPolicy.md)

<!-- ABOUT THE PROJECT -->
## About The Project

Video-presentation [here](https://youtu.be/UQXQI9L9ASY)


## Features
- Meals
   - List of random meals
   - List of meals categories 
   - List of meals from the selected category
   - Detail of selected Meal
   - Add/Remove from the "Cook later" list
   
- Drinks
   - List of random drinks
   - List of drinks categories 
   - List of drinks from the selected category
   - Detail of selected Drink
   - Add/Remove from the "Cook later" list

## Technologies Used

* MVVM app architecture
* Parsing JSON from [TheMealDB API](https://www.themealdb.com/) and [TheCoctailDB API](https://www.thecocktaildb.com/) transforming it to fit the required model, along with persisting the data.
* Keeping a clear separation of concerns between classes (API managers, model controllers and carving datasources away from view controllers).
* Using 3rd party libraries with CocoaPods.
* RealmSwift
* Networking using Alamofire
* Autolayout
* Custom UICollectionViews
* Animation
