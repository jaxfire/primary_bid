# Primary Bid Task

## Architecture
This project was used as an attempt to come up with an architecture that minimises boilerplate 
whilst still adhering (loosely) to Clean Architecture guidelines. I also wanted to try using a
'feature-first' approach rather than 'layer-first'.
https://codewithandrea.com/articles/flutter-project-structure/

As such here's the structure...

lib
- feature
- - auth
- - cart
- - categories
- - login
- - product
- - - model
- - - product_repository
- - - product_data_sources
- presentation
- - categories_screen
- - login_screen
- - product_list_screen
- - - cubit
- - - widgets
- - - product_list_screen

With this architecture a 'feature' is not considered a screen(s), instead it's 'something the app 
can do'. If we skim the feature directory, we can easily see all the functionality available to us
as developers (auth, cart, login etc). This allows us to build Screens and their corresponding state
management service (in this case Bloc/Cubit) and use the features as reusable chunks of 
functionality.

There is no domain layer here. With mny goal of minimising boilerplate in mind I decided to skip it.
UseCases/Interactors were merely useless facades for our repositories and due to using Freezed to
generate our entities no Model/Entity mapping was required. If we want to change our Data classes
we need only do it in one place and then regenerate the files.

I'm not suggesting I'd always use this architecture but it fit this project's requirements nicely 
and allowed for speedy development without restricting the ability to easily test everything that 
should be tested.

## Devices
Due to my hardware limitations this project has only been tested on an Android device.

## HTTP
I used the simple http package for requests in the project however the https://fakestoreapi.com/ 
server's response is really slow. If I’d known this upfront I would have opted for the Dio Http 
package with request caching.

## Cart Behaviour
I read the requirements very literally 'Each button should add/remove products from the state'.
A such the cart will only allow you to add one of each Product at a time. I realise this probably
isn't the expected behaviour. If I had more time I'd update this to allow for adding multiples of
the same product.

## Tests
Again due to time constraints I haven't achieved a full test coverage but hopefully you can see how 
this architecture allows for ease of testing with the few tests that do exist. I've provided a few 
unit tests for each feature layer (repository and data sources) and some BlocTests in the bloc layer.
See categories_cubit_test.dart.
UI and Integration tests aren't included but they could be given extra time.

