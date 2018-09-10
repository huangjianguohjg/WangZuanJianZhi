#import "UIColor+RandomColor.h"
@implementation UIColor (RandomColor)
+ (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)sp_getMediaData {
    NSLog(@"Continue");
}
@end
