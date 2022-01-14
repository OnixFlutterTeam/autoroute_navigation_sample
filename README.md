# auto_route_demo_flow

A new Flutter project.

##run the generator
#Use the [watch] flag to watch the files' system for edits and rebuild as necessary.
flutter packages pub run build_runner watch     

#if you want the generator to run one time and exits use
flutter packages pub run build_runner build        


#DL URL scheme
auto_route_demo://autoroutedemo.page.link/<path>

#nav to signUp
adb shell am start -a android.intent.action.VIEW \
-c android.intent.category.BROWSABLE \
-d 'auto_route_demo://autoroutedemo.page.link/auth/signUp'

#nav to settings
adb shell am start -a android.intent.action.VIEW \
-c android.intent.category.BROWSABLE \
-d 'auto_route_demo://autoroutedemo.page.link/main/settings'

#nav to add_product
adb shell am start -a android.intent.action.VIEW \
-c android.intent.category.BROWSABLE \
-d 'auto_route_demo://autoroutedemo.page.link/main/home/products/add_product'

#nav to info
adb shell am start -a android.intent.action.VIEW \
-c android.intent.category.BROWSABLE \
-d 'auto_route_demo://autoroutedemo.page.link/main/home/info'