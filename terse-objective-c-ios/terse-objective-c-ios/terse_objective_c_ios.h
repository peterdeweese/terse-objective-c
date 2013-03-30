#import <Foundation/Foundation.h>

#define $format(format, objs...) [NSString stringWithFormat: format, objs]

#define $size(w, h) CGSizeMake(w, h)
#define $point(x, y) CGPointMake(x, y)
#define $rect(x, y, w, h) CGRectMake(x, y, w, h)

@interface terse_objective_c_ios : NSObject
@end