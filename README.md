# DeliMeals

################################################################################

This application is to explore various dishes/meals of different categories. This application is created to learn about creating multiple screens and navigation.

################################################################################

Step 1 - Created Home page (categories_page.dart) and added GridView for categories in it.

Step 2 - Styling and theming GridView. Added new Font styles for Caregory titles.

Step 3 - Added another page. On clicking any category, you will be redirected to a sample page. This is implemented using Navigator class and push() method taking MaterialPageRoute() arguement.

Step 4 - Used new method pushNamed for going to new directory. First added the detail of route in Route arguement in main.dart file in MyApp function's scaffold. For passing arguements, used named arguement "arguement" in pushNamed method by sending map. Then this passed map was caught in second screen and extracted values using ModelRoutes method (ModelRoute.of(context.settings.arguemnts as Map<String,String>)).

Step 5 - Created new model for meals. Made changes in dummy_data.dart files by adding few meals and their details. For testing, implemented ListView to display title of meals in the respective category page.

Step 6 - Implemented meals page. New widget meal_item.dart is created to generate each meal in the list of meals of specific category. On category_meals_page you will see all the meals that beongs to selected category.

Step  7 - Completed the meals recipe page. Used Listiew for Ingredients and ListView + ListTile for the steps. Divider() used to insert ruler between the steps. 

Step 8 - Added Tabs to manage Categories page and Favourites page.

Step 9 - Implemented Bottom Navigation bar instead of tabs on the tab.

Step 10 - Added drawer on top using drawer arguement in Scaffold.

Step 10 - Contents in drawer added. New page for filter screen created.

Step 11 - Used pushReplacementNamed() instead of pushNamed() to avoid creation of multiple screens in background stack of screens.

Step 12 - New feature added to remove specific meal from the list. Used pop() with data passing to previous page and retrieving passed data using .then() with Navigator.

Step 13 - Completed filter feauture. For applying filters, used SwitchListTile and boolean values to apply filters.

Step 14 - Finished the app after completing favorites section by removing remove feature that was added before and using same floating action button to add and remove the meal as a favorite.




