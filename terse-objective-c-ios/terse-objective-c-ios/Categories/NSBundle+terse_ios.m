#import "NSBundle+terse_ios.h"

@implementation NSBundle (terse_ios)

-(NSURL*)URLForResource:(NSString*)resource
{
    return [self URLForResource:resource withExtension:nil];
}

@end
