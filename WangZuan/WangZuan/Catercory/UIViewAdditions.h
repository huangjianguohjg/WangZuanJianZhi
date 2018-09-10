#import <UIKit/UIKit.h>
@interface UIView (TTUIAdditions)
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;
@property (nonatomic, retain) UIColor *borderColor;
@property (nonatomic, readonly) UIViewController *viewController;

- (void)sp_checkDefualtSetting:(NSString *)string;
@end
