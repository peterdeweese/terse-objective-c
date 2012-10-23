#import <Foundation/Foundation.h>
#import "NSArray+terse_ios.h"
#import "NSBundle+terse_ios.h"
#import "NSDate+terse_ios.h"
#import "UIBarButtonItem+terse_ios.h"
#import "UIDevice+terse_ios.h"
#import "UIToolbar+terse_ios.h"
#import "UIView+terse_ios.h"

#define $format(format, objs...) [NSString stringWithFormat: format, objs]

#define $size(w, h) CGSizeMake(w, h)
#define $point(x, y) CGPointMake(x, y)
#define $rect(x, y, w, h) CGRectMake(x, y, w, h)

@interface terse_objective_c_ios : NSObject
@end