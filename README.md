# GoRecipe

## Project Overview 

GoRecipe is a mobile application that utilizes data and visual processing to generate customized cooking recipes for the user. The user will be able to create an account which will store user information and preferences, such as preparation time, dietary restriction, or cuisine, allowing for a customized experience. Through GoRecipe, the user can take a picture of an ingredient or upload an existing picture of an ingredient through the application, and it will be identified through visual processing. The user will be given the choice to search for recipes based on various parameters, including cuisine, season, preparation time, or dietary restriction. Using the ingredients found in the scanned image, as well as the user's stored preferences, GoRecipe will generate a list of recipes that the user can cook. The ability to scan ingredients that a user has on hand gives the user a variety of personalized options while removing the need to purchase additional ingredients. The option to filter by cuisine or season allows the user to try a new recipe while also being provided with meal options that they are interested in cooking. Finally, the option to specify any allergies that need to be taken into consideration, as well as the amount of time the user is willing to take to cook the meal, can help to keep the user satisfied with their recipe results. After this list of personalized recipes has been generated for the user, the product will give the option to save favorited recipes to the user’s personal cookbook, which they can view later within the application. These saved recipes will also be used to generate similar recipe recommendations for the user in the future. Using these saved recipes or new searches, the user can also utilize our calendar feature. This feature presents a standard calendar that can be used for meal planning using recipes found throughout GoRecipe, allowing the user to schedule which recipes they will be making throughout the week to help with organization and lessen the stress of cooking. The combination of the calendar feature and ingredient image recognition ensures that GoRecipe will provide completely personalized recipe suggestions, setting our product apart. Additionally, these features encourage our users to return to the application to revisit their favorite recipes. The conceptual design behind this product is to use Dart and Flutter to create a client mobile application. The backend of the application will be implemented as a RESTful API with Java and Spring Boot and will rely on The Spoonacular Recipe and Food API to generate personalized recipes for the user. This API provides the backend engine with data on the relationship between ingredients and recipes, as well as categorizations of recipes, allowing for increased suggestion accuracy. The backend engine will also leverage IBM Watson's Food Recognition Model to process user images. It will rely on AWS S3 Buckets to store these user-uploaded images, as well as Google Cloud SQL to store user and recipe information. The backend engine will be deployed on Google App Engine. This product will reference a previously created open-source project which is listed below in the background section of this document. This project will serve as the bare bones GoRecipe as it is still very early in development. In terms of products that may be similar, there are mobile applications that exist that allow you to search for recipes based on certain cuisines and others that allow you to search based on ingredients, but none that combine all of these preferences which is what sets this product apart from the competition. 


## See the Acceptance Testing Document [here](https://github.com/Capstone-Projects-2022-Spring/project-gorecipe/blob/updateReadMe/GoRecipe_Acceptance_QA_Testing_doc.xlsx)


## See the Latest Release [here](https://github.com/Capstone-Projects-2022-Spring/project-gorecipe/releases/tag/v3.0)


## Contributors 

- Casey Maloney 
- Olivia Felmey 
- Yaki Lebovits 
- Phi Truong 
- Yara Alzhrani 
- Anna Gillen 
- Sean Williams

### See the backend application [here](https://github.com/Capstone-Projects-2022-Spring/gorecipecore)
