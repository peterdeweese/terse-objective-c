#import "TerseBoundDictionary.h"

@implementation TerseBoundDictionary

@synthesize dictionary;

-(id)initWithDictionary:(NSDictionary*)d
{
    if(self = [super init])
        dictionary = d;
    return self;
}

-(id)dynamicGet:(NSString*)methodName
{
    return [dictionary objectForKey:methodName];
}

-(void)dynamicSet:(NSString*)methodName object:(id)o
{
    if([dictionary isKindOfClass:NSMutableDictionary.class])
    [((NSMutableDictionary*)dictionary) setObject:o forKey:methodName];
}

@end
