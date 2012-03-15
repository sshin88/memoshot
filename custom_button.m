#import "custom_button.h"

@implementation custom_button

@synthesize path;

- (void)setImagePath:(NSString*)path {
	self.path = @"icon.png";
}

- (void)drawRect:(CGRect)rect {
	self.path = @"icon.png";
	//if(self.path != nil) {
		UIImage *image = [UIImage imageNamed:self.path];
		[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	//}
}

@end
