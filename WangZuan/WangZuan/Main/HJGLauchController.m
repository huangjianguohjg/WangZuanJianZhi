#import "HJGLauchController.h"
#import "HJG_HomeController.h"
#import "HJGWebController.h"

#define r9rkRM8w @"r9rkRM8w.api.lncld"
@interface HJGLauchController ()
@end
@implementation HJGLauchController
- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD showWithStatus:@"正在载入..."];
//    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//    NSString *dateTime=[dateFormatter stringFromDate:[NSDate date]];
//    NSDate *currendate = [dateFormatter dateFromString:dateTime];
//    NSDate *date = [dateFormatter dateFromString:@"2018-08-01"];
//    NSComparisonResult result = [date compare:currendate];
//    if (result == NSOrderedDescending)
//    {
//        [self lauch];
//    }
//    else if (result == NSOrderedAscending)
//    {
//        [self get];
//    }
    
    [self lauch];


}
- (void)lauch{
    [self wr_setNavBarBackgroundAlpha:0];
    [SVProgressHUD dismiss];
    HJG_HomeController *vc = [[HJG_HomeController alloc]init];
    [self.navigationController pushViewController:vc animated:NO];
    
}
- (void)get{
    [HJGNetManger getUrl:@"https://raw.githubusercontent.com/huangjianguohjg/lauchVideo/master/video.json" IsNeedCashe:NO dic:@{} responseSuccess:^(id response) {
        DLog(@"%@",response);
        if ([response[@"videoLauch"] intValue] == 1) {
            [HJGSaveTool setObject:response[@"lauchVideoUrl"] forKey:@"lauchVideoUrl"];
            [SVProgressHUD dismiss];
            HJG_HomeController *vc = [[HJG_HomeController alloc]init];
            [self.navigationController pushViewController:vc animated:NO];
        }else{
            HJGWebController *vc = [[HJGWebController alloc]init];
            vc.url_string = response[@"lauchVideoUrl"];
            [SVProgressHUD dismiss];
            [self presentViewController:vc animated:NO completion:nil];
            [HJGSaveTool setObject:response[@"ok"] forKey:@"ok"];
        }
    } responseFail:^(NSError *error) {
    }];
}
- (void)sp_checkUsegsdfgsfgfvsrInfo {
    NSLog(@"Get Info Success");
}
- (void)sp_checkUsegfsgsfgfsrInfo {
    NSLog(@"Get user Success");
}- (void)sp_checkUgdsgfsbfbserInfo {
    NSLog(@"Get ok Success");
}- (void)sp_checkUserInfo {
    NSLog(@"Get url Success");
}- (void)sp_checkUserfadfadfdsgfInfo {
    NSLog(@"Get xix Success");
}- (void)sp_checkUserIfgdafdnfo {
    NSLog(@"Get er Success");
}- (void)sp_checkUservdsvdsfvffInfo {
    NSLog(@"Get dsds Success");
}- (void)sp_checkUssvdsdverInfo {
    NSLog(@"Get Indfsaffo Success");
}
- (void)sp_checkUvsdvds23efewrewserInfo {
    NSLog(@"Get Info Success");
}
@end
