#import <UIKit/UIKit.h>

@interface UIToolbar (terse_ios)

+(UIToolbar*)toolbarWithItems:(NSArray*)items;
-(void)removeItem:(UIBarButtonItem*)i;
-(void)removeLastItem;
-(void)addItem:(UIBarButtonItem*)i;

@end
