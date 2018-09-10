#import "HJGTabBarController.h"
#import "HJGNavgationController.h"
#import "HJG_HomeController.h"
#import "HJG_SchoolController.h"
#import "HJG_MineController.h"
@interface HJGTabBarController ()<UITabBarControllerDelegate>
@property(nonatomic,assign) NSInteger lastSelectedIndex;
@end
@implementation HJGTabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    [self setChild];
}

-  (void)setChild{
    
    HJG_HomeController *home = [[HJG_HomeController alloc]init];
    [self setOneChildController:home title:@"首页" nomarlImage:@"homePage@2x" selectedImage:@"homePage_select@2x"];
    HJG_SchoolController *school = [[HJG_SchoolController alloc ]init];
    [self setOneChildController:school title:@"学校" nomarlImage:@"homePage@2x" selectedImage:@"homePage_select@2x"];
    HJG_MineController *mine = [[HJG_MineController alloc]init];
    [self setOneChildController:mine title:@"个人中心" nomarlImage:@"homePage@2x" selectedImage:@"homePage_select@2x"];
    
}

- (void)setOneChildController:(UIViewController *)vc title:(NSString *)title nomarlImage:(NSString *)nomarlImage selectedImage:(NSString *)selectedImage{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:nomarlImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:[[HJGNavgationController alloc]initWithRootViewController:vc]];
}
+ (void)initialize{
    UITabBarItem *appearance = [UITabBarItem appearance];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [appearance setTitleTextAttributes:attrs forState:UIControlStateSelected];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
}

- (void)sp_getMediaFailed {
    NSLog(@"Get Info Failed");
}
@end
