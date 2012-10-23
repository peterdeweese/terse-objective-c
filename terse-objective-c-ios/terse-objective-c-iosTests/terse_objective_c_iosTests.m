#import <SenTestingKit/SenTestingKit.h>
#import "terse_objective_c_ios.h"

@interface terse_objective_c_iosTests : SenTestCase
@end

@implementation terse_objective_c_iosTests

-(void)testFormatMacro
{
    STAssertEqualObjects($format(@"%d %@", 86, @"test"), @"86 test", nil);
}

@end
