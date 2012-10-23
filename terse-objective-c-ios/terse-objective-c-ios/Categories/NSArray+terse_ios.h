#import <Foundation/Foundation.h>

@interface NSArray (terse_ios)

@property(readonly) id first;
@property(readonly) id last;

-(NSArray*)arrayByRemovingLastObject;
-(NSArray*)arrayByRemovingObject:(id)anObject;

@end
