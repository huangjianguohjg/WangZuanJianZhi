#import <UIKit/UIKit.h>
@interface UIWebView (JavaScript)
- (int)nodeCountOfTag:(NSString *)tag;
- (NSString *)getCurrentURL;
- (NSString *)getTitle;
- (NSString *)getContent;
- (NSMutableArray *)getImgs;
- (NSArray *)getOnClicks;
- (void)setBackgroundColor:(UIColor *)color;
- (void)addClickEventOnImg;
- (void)setFontColor:(UIColor *)color withTag:(NSString *)tagName;
- (void)setFontSize:(int)size withTag:(NSString *)tagName;
- (void)disableTouchCallout;
//股哟地区企业工业高要求我姑爷国有股预告预告哟哟股
- (void)sp_checkInfo;
@end
