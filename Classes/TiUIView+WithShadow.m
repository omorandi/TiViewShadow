#import "TiUIView+WithShadow.h"
#import "TiProxy.h"
#import "JRSwizzle.h"


@interface TiUIView ()
-(void)checkBounds;
@end


@implementation TiUIView (WithShadow)


+(void)load
{
    /*
     HERE we extend the TiUIView checkBounds through the method swizzling technique described here:
     http://www.cocoadev.com/index.pl?MethodSwizzling
     https://github.com/rentzsch/jrswizzle
     
     it works in this way:
     * in this category we define a specialized checkBoundsAlt method 
     * in the initialize method we swap the original checkBounds with our checkBoundsAlt
     
     it will happen that every call to [myView checkBounds] will be redirected to the implementation provided by
     checkBoundsAlt here.
     Again, in this specialized implementation we want to call the one originally provided by checkBounds, but once
     the methods implementations have been swapped, this will be found with the name checkBoundsAlt.
     This is why apparently checkBoundsAlt calls itself. Actually after method swizzling, a call to checkBoundsAlt will
     be redirected to the original checkBounds implementation
     
     Why overriding checkBounds instead of frameSizeChanged? because it's the method calling the frameSizeChanged 
     method, which is the hook used by TiUIView subclasses for being notified about frame & bounds changes. 
     Since we cannot be sure that subclasses of TiUIView call [super frameSizeChanged], we need to play safe.
    */
    
    NSError *error = nil;
    
    [TiUIView jr_swizzleMethod:@selector(checkBounds) withMethod:@selector(checkBoundsAlt) error:&error];
    if (error != nil) {
        NSLog(@"[ERROR] %@", [error localizedDescription]);
    }
}

-(void)checkBoundsAlt
{
    [self checkBoundsAlt];

    NSDictionary *shadowProps = [self.proxy valueForUndefinedKey:@"shadow"];
   
    if (shadowProps == nil)
        return;
    
    NSNumber *radius = [self.proxy valueForUndefinedKey:@"borderRadius"];;
    UIBezierPath *shadowPath = nil;
    if (radius != nil) 
    {
        shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[radius floatValue]];
    }
    else 
    {
        shadowPath = [UIBezierPath bezierPathWithRect:self.bounds];
    }
    
    [self.layer setShadowPath:[shadowPath CGPath]];
}


//this code is by Javier Rayon and was originally posted in the Titanium Q&A forum:
//http://developer.appcelerator.com/question/130784/trick-drop-real-shadows-in-titanium-ios

-(void)setClipsToBounds:(BOOL)clipsToBounds
{
    if (self.layer.shadowOpacity > 0) {
        // if there is shadow, we regret to clip
        [super setClipsToBounds:NO];
    } else {
        [super setClipsToBounds:clipsToBounds];
    }
}


-(void)setShadow_:(id)args
{
    if(args != nil)
    {
        self.layer.masksToBounds = NO; 
        self.clipsToBounds = NO;
       // self.superview.layer.masksToBounds = NO; //trying to avoid be clipped by parent view, but does not work
      //  self.superview.clipsToBounds = NO;
        
        //Support for retina display
        CGFloat scale;
        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
            scale=[[UIScreen mainScreen] scale];
        } else {
            scale=1; //only called on iPad.
        }
        
        self.layer.rasterizationScale = scale;

        [self.layer setShouldRasterize:YES];
        
        if ([args objectForKey:@"shadowOffset"] != nil) {
            CGPoint p = [TiUtils pointValue: [args objectForKey:@"shadowOffset"]];
            CGSize shadowOffset = {p.x,p.y};
            
            self.layer.shadowOffset = shadowOffset;
        }
        if ([args objectForKey:@"shadowOpacity"] != nil) {
            self.layer.shadowOpacity = [TiUtils floatValue:[args objectForKey:@"shadowOpacity"]];            
        }
        if ([args objectForKey:@"shadowRadius"] != nil) {
            self.layer.shadowRadius = [TiUtils floatValue:[args objectForKey:@"shadowRadius"]];
        }

        if ([args objectForKey:@"shadowColor"] != nil) {
            UIColor * shadowColor = [[TiUtils colorValue:[args objectForKey:@"shadowColor"]] _color];
            [self.layer setShadowColor:[shadowColor CGColor]];            
        }
             
    }
}

@end
