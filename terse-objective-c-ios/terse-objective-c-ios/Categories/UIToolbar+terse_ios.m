#import "UIToolbar+terse_ios.h"
#import "terse_objective_c_ios.h"

@implementation UIToolbar (terse_ios)

+(UIToolbar*)toolbarWithItems:(NSArray*)items
{
    UIToolbar* bar = [[UIToolbar alloc] initWithFrame:$rect(0, 0, 0, 44.)];
    bar.items = items;
    
    UIView* v = bar.subviews.last;
    bar.width = v.x + v.width;
    
    return bar;
}

-(void)removeItem:(UIBarButtonItem*)i
{
    self.items = [self.items arrayByRemovingObject:i];
}

-(void)removeLastItem
{
    self.items = [self.items arrayByRemovingLastObject];
}

-(void)addItem:(UIBarButtonItem*)i
{
    self.items = [self.items arrayByAddingObject:i];
}

@end
