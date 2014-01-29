

#import "AppDelegate.h"

#import "ViewController.h"
#import <RestKit/RestKit.h> 

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize session = _session;


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:self.session];
}

- (void)applicationWillTerminate:(UIApplication *)application {

    [self.session close];
}

#pragma mark Template generated code

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main_iPhone"
                                                             bundle: nil];
    ViewController *loginController = [mainStoryboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    self.window.rootViewController = loginController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppEvents activateApp];
    
    [FBAppCall handleDidBecomeActiveWithSession:self.session];
}

@end
