#import "TerseDynamicMethodResolver.h"

// For read-write, send an NSMutableDictionary to initWithDictionary
@interface TerseBoundDictionary : TerseDynamicMethodResolver
  -(id)initWithDictionary:(NSDictionary*)d;

  @property(nonatomic, readonly) NSDictionary* dictionary;
@end
