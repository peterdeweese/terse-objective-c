#import "terse_objective_c_ios.h"
#import "TerseDynamicMethodResolver.h"
#import <objc/runtime.h>

@implementation TerseDynamicMethodResolver

#pragma mark Dynamic Methods

-(void)dynamicSet:(NSString*)methodName object:(id)o
{
    @throw [NSException exceptionWithName:@"Override This Method" reason:nil userInfo:nil];
}

-(id)dynamicGet:(NSString*)methodName
{
    @throw [NSException exceptionWithName:@"Override This Method" reason:nil userInfo:nil];
    return nil;
}

-(void)dynamicSet:(NSString*)methodName double:(double)d
{
    @throw [NSException exceptionWithName:@"Override This Method" reason:nil userInfo:nil];
}

-(double)dynamicGetDouble:(NSString*)methodName { return NAN; }

//TODO: there should be a better way to get from a setter name to a property
+(NSString*)stripSet:(NSString*)s //remove ^set
{
    NSString *method = [s substringFromIndex:3];
    method = [method substringToIndex:method.length - 1]; //remove :$
    method = [method stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[method substringToIndex:1].lowercaseString];
    return method;
}

id getIMP(TerseDynamicMethodResolver *self, SEL cmd);
id getIMP(TerseDynamicMethodResolver *self, SEL cmd)
{
    return [self dynamicGet:NSStringFromSelector(cmd)];
}

//TODO pass property name instead of calculating it again
void setIMP(TerseDynamicMethodResolver *self, SEL cmd, id obj)
{    
    [self dynamicSet:[TerseDynamicMethodResolver stripSet:NSStringFromSelector(cmd)] object:obj];
}

double getDoubleIMP(TerseDynamicMethodResolver *self, SEL cmd)
{
    return [self dynamicGetDouble:NSStringFromSelector(cmd)];;
}

void setDoubleIMP(TerseDynamicMethodResolver *self, SEL cmd, double d)
{    
    [self dynamicSet:[TerseDynamicMethodResolver stripSet:NSStringFromSelector(cmd)] double:d];
}

+(NSString*)typeNameStringForProperty:(NSString*)propertyName inClass:(Class)c
{
    objc_property_t property = class_getProperty(c, propertyName.UTF8String);
    if(!property) return nil;
	const char * attrs = property_getAttributes( property );
	if ( attrs == NULL )
		return ( NULL );
    
	static char buffer[256];
	const char * e = strchr( attrs, ',' );
	if ( e == NULL )
		return ( NULL );
    
	int len = (int)(e - attrs);
	memcpy( buffer, attrs, len );
	buffer[len] = '\0';
    
    return [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
}

+ (BOOL)resolveInstanceMethod:(SEL)aSEL
{
    NSString *property = NSStringFromSelector(aSEL);
    BOOL isSet = [property hasPrefix:@"set"];
    if(isSet) property = [self stripSet:property];
    //TODO: this could be generisized for all primitives
    BOOL isDouble = [@"Td" isEqualToString:[self typeNameStringForProperty:property inClass:self.class]];
    
    IMP imp;
    const char* types;
    
    
    if(isSet)
    {
        imp = isDouble ? (IMP)setDoubleIMP : (IMP)setIMP;
        types = "v@:"; //TODO: use @encode() instead
    }
    else
    {
        imp = isDouble ? (IMP)getDoubleIMP : (IMP)getIMP;
        types = isDouble ? "d@:@" : "@@:@"; //TODO: use @encode() instead
    }
    
    class_addMethod(self.class, aSEL, imp, types);
    
    return YES;
}

-(id)valueForKey:(NSString*)key
{
    return [self dynamicGet:key];
}

@end
