#import "ViewController.h"

#import "AppDelegate.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) id<FBGraphUser> loggedInUser;
@property (strong, nonatomic) NSString *password;

@end

@implementation ViewController

@synthesize email;
@synthesize password;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create Login View so that the app will be granted "status_update" permission.
    FBLoginView *loginview = [[FBLoginView alloc] initWithReadPermissions:@[@"basic_info", @"email"]];
    
    loginview.frame = CGRectOffset(loginview.frame, 5, 5);
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        loginview.frame = CGRectOffset(loginview.frame, 5, 25);
    }
    loginview.delegate = self;
    
    [self.view addSubview:loginview];
    
    [loginview sizeToFit];
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    self.email.text = [NSString stringWithFormat:@"Hello %@!", [user objectForKey:@"email"]];
    self.loggedInUser = user;
    
    if (self.password == NULL) {
        self.password = [self generatePassword];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:self.password forKey:@"password"];
        [userDefaults synchronize];
        NSLog(@"%@", self.password);
    }
    
}

-(void save){
    
}

- (void)viewDidUnload
{
    self.email = nil;
    self.loggedInUser = nil;
    [super viewDidUnload];
}



- (NSString *) generatePassword {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: 10];
    for (int i=0; i<10; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    return randomString;
}



@end
