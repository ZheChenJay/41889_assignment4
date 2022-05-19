# 41889_assignment3

This application is mainly a class of online shopping software interaction, based on achieving product browsing, product detailed page, product comments browsing, product collection and other functions.

GitHub repo.:https://github.com/ZheChenJay/41889_assignment4

The contributor of this project:
| Student Name    |  Student Email                      |
| :-------------  |  ---------------------------------: | 
| Zhe Chen        |  Zhe.Chen-3@student.uts.edu.au      |
| Yueyang Hong    |  Yueyang.Hong-1@student.uts.edu.au  |
| Longlei Guo     |  Longlei.Guo-1@student.uts.edu.au   | 
| Bingzhen He     |  Bingzhen.He-1@student.uts.edu.au   |

-----

## Table of Contents
* [Version](#Version)
* [Environment](#Environment)
* [Package dependence](#Package-dependence)
* [API](#API)
* [Product Browsing](#Product-Browsing)
* [Product Detailed Page](#Product-Detailed-Page)
* [Product Collection](#Product-Collection)
* [Development Cycle](#Development-Cycle)
* [Contribution](#Contribution)
* [The iterative direction](#The-iterative-direction)

-----

## Version
### shopping app
#### new function
##### version 1.0.0
* Product list
* Product detail
* Favourite product collection

-----
-----
## Environment
Xcode 13.3.1
CocoaPods 1.11.3

-----
## Package dependence
###Alamofire
Used to send requests for network data. Go detail to: [Alamofire](https://github.com/Alamofire/Alamofire)
###SDWebimage
Used to send requests for network image data. Go detail to: [SDWebimage](https://github.com/SDWebImage/SDWebImage)
###MJRefresh
Implement drop-down refresh page.Go detail to: [MJRefresh](https://github.com/CoderMJLee/MJRefresh)
###PKHUD
Implement error popovers.Go detail to:[PKHUD](https://github.com/pkluz/PKHUD)

-----
## API
### IPhone data
IPhone.json:[IPhone.json](https://github.com/ZheChenJay/API-product/blob/main/API/Shopping/iPhone_1.json)
Image: [image](https://github.com/ZheChenJay/API-product/tree/main/API/Shopping/Image)

-----
## Product Browsing
On this page, product list has been shown. Through the way of sliding down, more product will be appeared.

Each product has a name, price, rating, picture of the item and a favorite button. The above data is from Amazon.

-----
## Product Detailed Page
By clicking the cell, the screen will jump to product detailed page. On this page, it will demonstrate more detailed information about the specific product.

Through swiping the screen, the pictures of product can be seen from different angles and the comments of this product from different people. Users rate the product in terms of satisfaction. From 0 to 5 stars, the more stars, the higher the satisfaction.

-----
## Product Collection
When the user clicks the favourite button, the screen will jump into a page where collects all user preferences.

The favourite button turns red which means you have saved this product into your collection successfully.

These preferences will save locally. Preferences will not be removed when existing the application.

-----
## Development Cycle
Determine the requirements - > general idea of the storyboard - > Determine the design plan through the storyboard (here mainly the components and interfaces that each storyboard may need) - > Division of work (including the expected work content and workload of each storyboard) - > code writing - > testing and bug fixing - > review requirements and propose new requirements

-----
## Contribution
The contribution of this project:
| Student Name    |  Student Email                      |   Contribution                |
| :-------------  |  ---------------------------------: |   :-------------------------- |
| Zhe Chen        |  Zhe.Chen-3@student.uts.edu.au      | 	Design ideas, Product list page, Product detail page, Produck collection page, testing & debug,readme	        |
| Yueyang Hong    |  Yueyang.Hong-1@student.uts.edu.au  | 	Design ideas, Product list page, Produck collection page, testing & debug,readme	        |
| Longlei Guo     |  Longlei.Guo-1@student.uts.edu.au   | 	Design ideas, Product list page, Product detail page, testing & debug,readme	        |
| Bingzhen He     |  Bingzhen.He-1@student.uts.edu.au   | 	Design ideas, Product list page, Product detail page, Json & image,testing & debug	        |

-----
## The iterative direction
* Implement shopping cart functionality by rewriting collection Page
* Interface beautification
	* UI design
	* Animation
* Safety and stability
* Device Compatibility
