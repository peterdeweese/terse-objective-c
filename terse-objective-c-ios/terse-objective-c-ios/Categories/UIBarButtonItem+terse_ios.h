#import <UIKit/UIKit.h>

@interface UIBarButtonItem (terse_ios)

+(UIBarButtonItem*)barButtonItemWithCustomView:(UIView*)v;
+(UIBarButtonItem*)barButtonItemWithTitle:(NSString*)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action;
+(UIBarButtonItem*)barButtonItemWithBarButtonSystemItem:(UIBarButtonSystemItem)item target:(id)target action:(SEL)action;

@end
