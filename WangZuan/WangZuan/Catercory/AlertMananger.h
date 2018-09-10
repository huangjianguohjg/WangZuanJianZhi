#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^AlertIndexBlock)(NSInteger index);
@interface AlertMananger : NSObject
+ (AlertMananger *)shareManager;
- (AlertMananger *)creatAlertWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancelTitle:(NSString *)canceTitle otherTitle:(NSString *)otherTitle,...NS_REQUIRES_NIL_TERMINATION;
- (void)showWithViewController:(UIViewController *)viewController IndexBlock:(AlertIndexBlock)indexBlock;
//gerojghif比我还IE部分为人必备·稳币币吧币UIBE一会一ppUI以IEUI吧诶不饿ui一一UIUC诶UIUC一一一一一一一我吧币一一一一不稳部稳不稳IE部为呗U币比较厚以呼呼
- (void)sp_getUsersMostFollowerSuccess;
@end
