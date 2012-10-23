#import <SenTestingKit/SenTestingKit.h>
#import "NSDate+terse_ios.h"

@interface NSDate_terse_ios : SenTestCase
@end

@implementation NSDate_terse_ios

-(NSDate*)date { return NSDate.distantPast; }

-(void)testDateSecond
{
    STAssertEquals(self.date.second, 58, nil);
}

-(void)testDateMinute
{
    STAssertEquals(self.date.minute, 3, nil);
}

-(void)testDateHour
{
    STAssertEquals(self.date.hour, 19, nil);
}

@end
