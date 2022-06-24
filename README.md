# primary_bid

Primary Bid Task

## Notes

### Architecture
This project was used as an attempt to come up with an architecture that minimise boilerplate whilst
still adhering (loosely) to Clean Architecture guidelines. I also wanted to use a 'feature-first' 
approach rather than 'layer-first'. https://codewithandrea.com/articles/flutter-project-structure/

As such here's the structure...
> lib
> > feature
> > > auth
> > > cart
> > > categories
> > > login
> > > product
> > > > model
> > > > product_repository
> > > > product_data_sources


### Devices
Due to my hardware limitations this project has only been tested on an Android device.

### HTTP
I used the simple http package for requests in the project however the https://fakestoreapi.com/ 
server's response is really slow. If I’d known this upfront I would have opted for the Dio Http 
package with request caching.

### Cart Behaviour
I read the requirements very literally 'Each button should add/remove products from the state'.
A such the cart will only allow you to add one of each Product at a time. I realise this probably
isn't the expected behaviour. If I had more time I'd update this to allow for adding multiples of
the same product.

### Tests
Again due to time constraints I haven't acheived a full test coverage but hopefully you can see how 
this architecture allows for ease of testing with the few tests that do exist. I've provided a few 
unit tests for each feature layer (repository and data sources) and some BlocTests in the bloc layer.
See categories_cubit_test.dart.

