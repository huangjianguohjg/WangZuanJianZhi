#import <Foundation/Foundation.h>
typedef void( ^ HJGResponseSuccess)(id response);
typedef void( ^ HJGResponseFail)(NSError *error);
@interface HJGNetManger : NSObject
+ (void)getUrl:(NSString *)rArgument IsNeedCashe:(BOOL)cashe dic:(NSDictionary *)dic responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;
+ (void)postUrl:(NSString *)rArgument paramDic:(NSDictionary *)paraDic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;
- (void)sp_upload:(NSString *)string;
@end
