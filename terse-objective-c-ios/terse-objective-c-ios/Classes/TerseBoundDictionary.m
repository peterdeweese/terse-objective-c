#import "TerseBoundDictionary.h"

@interface TerseBoundDictionary()

@property(nonatomic, readwrite) NSDictionary* dictionary;

@end

@implementation TerseBoundDictionary

-(id)initWithDictionary:(NSDictionary*)d
{
    if(self = [super init])
        self.dictionary = d;
    return self;
}

-(id)dynamicGet:(NSString*)methodName
{
    return self.dictionary[methodName];
}

-(void)dynamicSet:(NSString*)methodName object:(id)o
{
    if([self.dictionary isKindOfClass:NSMutableDictionary.class])
        ((NSMutableDictionary*)self.dictionary)[methodName] = o;
}

@end
