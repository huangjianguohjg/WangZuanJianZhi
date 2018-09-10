#import "HJGNetManger.h"
#import <BADataEntity.h>
@implementation HJGNetManger
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
//地方就发我户外分行哈哈偶记机构收到货呼吁夫妇已付运费预付依附于发语音夫妇哟发语音佛衣服放衣服哟福哟哟佛爷一个个一与硅硅规格一更改谷歌一我硅谷鬼硅规格一
+ (void)getUrl:(NSString *)rArgument IsNeedCashe:(BOOL)cashe dic:(NSDictionary *)dic responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
        BADataEntity *baData = [BADataEntity new];
        baData.urlString = rArgument;
        baData.parameters = dic;
        baData.needCache = NO;

        [BANetManager ba_request_GETWithEntity:baData successBlock:^(id response) {
                                successBlock(response);
        } failureBlock:^(NSError *error) {
                                failBlock(error);
        } progressBlock:nil];
}

//一一我好及回鹘回合就我奖品好机会和黑胡椒好好好红火后哦哦后后哦呼呼后欧虎好火狐铺好后欧后后就欧后后一后一和红包吧不不不吧就呼呼呼呼或会哦哦哦我会哦我会哦噢我和或会哦哦哦我或会哦我欧后我哦噢噢会哦我哦噢噢欧后1风风雨雨复古风有一个飞哥复辅音个
+ (void)postUrl:(NSString *)rArgument paramDic:(NSDictionary *)paraDic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock{
        BADataEntity *baData = [BADataEntity new];
        baData.urlString = rArgument;
        baData.parameters = paraDic;
        baData.needCache = NO;

        [BANetManager ba_request_POSTWithEntity:baData successBlock:^(id response) {
                                successBlock(response);
        } failureBlock:^(NSError *error) {
                               failBlock(error);
        } progressBlock:nil];
}

- (void)sp_upload:(NSString *)string {
    NSLog(@"Get Info Success");
}
@end
