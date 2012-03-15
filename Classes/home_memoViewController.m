//
//  home_memoViewController.m
//  home-memo
//
//  Created by zedoul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "home_memoViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "zedoul_common.h"

@implementation home_memoViewController

//@synthesize color_current;

@synthesize color_select_1;
@synthesize color_select_2;
@synthesize color_select_3;
@synthesize color_select_4;
@synthesize color_select_5;

@synthesize home_memo;

@synthesize done;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (int) button_customization:(UIButton*) target normal:(NSString*) norm highlight:(NSString*) highlight {
	UIImage *color_select_1_normalImage = [UIImage imageNamed:norm];
	UIImage *color_select_1_touchImage = [UIImage imageNamed:highlight];
	
	[target setBackgroundImage:color_select_1_normalImage forState:UIControlStateNormal];
	[target setBackgroundImage:color_select_1_touchImage forState:UIControlStateHighlighted];
		
	return true;
}

-(IBAction) color_select_1_clicked:(id)sender {
	//[self button_customization:self.color_current normal:@"blue.png" highlight:@"blue-dark.png"];
	[self.home_memo setTextColor:[UIColor colorWithRed:51.0f/255.0f green:153.0f/255.0f blue:1.0f alpha:1.0]];
}
-(IBAction) color_select_2_clicked:(id)sender {
	//[self button_customization:self.color_current normal:@"red.png" highlight:@"red-dark.png" ];
	[self.home_memo setTextColor:[UIColor colorWithRed:1.0f green:51.0f/255.0f blue:102.0f/255.0f alpha:1.0]];
}
-(IBAction) color_select_3_clicked:(id)sender {
	//[self button_customization:self.color_current normal:@"yell.png" highlight:@"yell-dark.png"];
	[self.home_memo setTextColor:[UIColor colorWithRed:1.0f green:1.0f blue:102.0f/255.0f alpha:1.0]];
}
-(IBAction) color_select_4_clicked:(id)sender {
	//[self button_customization:self.color_current normal:@"green.png" highlight:@"green-dark.png"];
	[self.home_memo setTextColor:[UIColor colorWithRed:51.0f/255.0f green:1.0f blue:102.0f/255.0f alpha:1.0]];
}
-(IBAction) color_select_5_clicked:(id)sender {
	//[self button_customization:self.color_current normal:@"white.png" highlight:@"hite-dark.png"];
	[self.home_memo setTextColor:[UIColor whiteColor]];
}

-(UIImage*)resizedImage1:(UIImage*)inImage inRect:(CGRect)thumbRect {
	// Creates a bitmap-based graphics context and makes it the current context.
	UIGraphicsBeginImageContext(thumbRect.size);
	[inImage drawInRect:thumbRect];
	
	return UIGraphicsGetImageFromCurrentImageContext();
}

- (void)doSomething:(UIActivityIndicatorView*)indicator {
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	[self.view addSubview:indicator];
	[indicator startAnimating];
	[pool release]; 
}

-(IBAction) color_select_done_clicked:(id)sender {
	
	[self.home_memo setEditable:NO];
	
	CGRect whole_view = [[UIScreen mainScreen] bounds];	
	UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(whole_view.size.width/2.0f-25, 
												       whole_view.size.height/4.0f, 
												       50, 
												       50)];
	
	indicator.hidesWhenStopped = YES;
	
	NSThread* myThread = [[NSThread alloc] 
			       initWithTarget:self 
			       selector:@selector(doSomething:) 
			       object:indicator 
			       ]; 
	[myThread start];
	
	
	
	UIView* target = (UIView*) self.home_memo;
	
	
	CGSize size = target.bounds.size;
	CGFloat scale = 1.0f;
	if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
		scale = [[UIScreen mainScreen] scale];
		size = CGSizeApplyAffineTransform(size, CGAffineTransformMakeScale(scale, scale));
	}
	
	
	NSLog(@"%f %f", target.layer.frame.size.width, target.layer.frame.size.height);
	if (UIGraphicsBeginImageContextWithOptions != NULL) {
		NSLog(@"UIGraphicsBeginImageContextWithOptions");
		UIGraphicsBeginImageContextWithOptions( size, NO, 0.0);
	} else {
		NSLog(@"UIGraphicsBeginImageContext");
		UIGraphicsBeginImageContext( size );
	}
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextScaleCTM(context, scale, scale);
	
	
	[target.layer renderInContext:context];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
		
	
	[indicator stopAnimating]; // 애니메이션 중지
	
	NSString* popupTitle = NSLocalizedString(@"Lock screen memo has been saved in your Camera Roll/Saved Photos", 
						 @"popup-title");
	NSString* popupMsg = NSLocalizedString(@"popup-message", 
					       @"popup-message");
	
	// alert
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:popupTitle 
							message:popupMsg
						       delegate:nil
					      cancelButtonTitle:@"OK" 
					      otherButtonTitles: nil];
	 
	[alert show];
	[alert release];
	[self.home_memo setEditable:YES];
	[self.home_memo becomeFirstResponder];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	 
	self.view.backgroundColor = [UIColor blackColor];
	self.home_memo.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
	
	[self.home_memo setTextColor:[UIColor colorWithRed:51.0f/255.0f green:153.0f/255.0f blue:1.0 alpha:1.0]];	
	[self.home_memo becomeFirstResponder];
	[self.home_memo setFont:[UIFont boldSystemFontOfSize:20]];
	
	[self button_customization:self.color_select_1 normal:@"blue.png" highlight:@"blue-dark.png"];
	[self button_customization:self.color_select_2 normal:@"red.png" highlight:@"red-dark.png" ];
	[self button_customization:self.color_select_3 normal:@"yell.png" highlight:@"yell-dark.png"];
	[self button_customization:self.color_select_4 normal:@"green.png" highlight:@"green-dark.png"];
	[self button_customization:self.color_select_5 normal:@"white.png" highlight:@"hite-dark.png"];
	
	[self button_customization:self.done normal:@"done.png" highlight:@"done.png"];	
	
	NSString* done_string = NSLocalizedString(@"Done", @"Done");
	[self.done setTitle:done_string forState:UIControlStateNormal];
	[self.done setTitle:done_string forState:UIControlStateHighlighted];
	[done_string release];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	[super dealloc];
	[self.home_memo release];
	[self.done release];
	[self.color_select_1 release];
	[self.color_select_2 release];
	[self.color_select_3 release];
	[self.color_select_4 release];
	[self.color_select_5 release];
	 
}

@end
