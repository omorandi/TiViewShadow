#import "TiUIView+WithShadow.h"


@implementation TiUIView (WithShadow)


//this code is by Javier Rayon and was originally posted in the Titanium Q&A forum:
//http://developer.appcelerator.com/question/130784/trick-drop-real-shadows-in-titanium-ios


-(void)setShadow_:(id)args
{
    if(args != nil)
    {
        self.layer.masksToBounds = NO; 
        
        if ([args objectForKey:@"shadowOffset"] != nil) {
            CGPoint p = [TiUtils pointValue: [args objectForKey:@"shadowOffset"]];
            CGSize shadowOffset = {p.x,p.y};
            
            self.layer.shadowOffset = shadowOffset;
        }
        if ([args objectForKey:@"shadowRadius"] != nil) {
            self.layer.shadowRadius = [TiUtils floatValue:[args objectForKey:@"shadowRadius"]];
        }
        if ([args objectForKey:@"shadowOpacity"] != nil) {
            self.layer.shadowOpacity = [TiUtils floatValue:[args objectForKey:@"shadowOpacity"]];            
        }

        if ([args objectForKey:@"shadowColor"] != nil) {
            UIColor * shadowColor = [[TiUtils colorValue:[args objectForKey:@"shadowColor"]] _color];
            [self.layer setShadowColor:[shadowColor CGColor]];            
        }

		// improve performance

		// [self.layer setShadowPath:[[UIBezierPath bezierPathWithRect:[self bounds] ] CGPath ] ]; // not working yet
		
		
		if ([args objectForKey:@"shadowPath"] != nil) {
            CGRect shadowRect = [TiUtils rectValue:[args objectForKey:@"shadowPath"]] ;
            [self.layer setShadowPath:[[UIBezierPath bezierPathWithRect:shadowRect ] CGPath]]; 
        }

        if ([args objectForKey:@"rasterize"] != nil) {
            [self.layer setShouldRasterize: [TiUtils boolValue:[args objectForKey:@"rasterize"] ]];
        }

    }
}

@end
