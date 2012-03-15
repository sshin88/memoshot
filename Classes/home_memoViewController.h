//
//  home_memoViewController.h
//  home-memo
//
//  Created by zedoul on 5/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
 
@interface home_memoViewController : UIViewController <UIAlertViewDelegate> {
	//IBOutlet UIButton* color_current;
	
	UIImage* det;
	
	IBOutlet UIButton* color_select_1;
	IBOutlet UIButton* color_select_2;
	IBOutlet UIButton* color_select_3;
	IBOutlet UIButton* color_select_4;
	IBOutlet UIButton* color_select_5;
	
	IBOutlet UITextView* home_memo;
	
	IBOutlet UIButton* done;
}

//@property (nonatomic, retain) IBOutlet UIButton* color_current;

@property (nonatomic, retain) IBOutlet UIButton* color_select_1;
@property (nonatomic, retain) IBOutlet UIButton* color_select_2;
@property (nonatomic, retain) IBOutlet UIButton* color_select_3;
@property (nonatomic, retain) IBOutlet UIButton* color_select_4;
@property (nonatomic, retain) IBOutlet UIButton* color_select_5;

@property (nonatomic, retain) IBOutlet UITextView* home_memo;

@property (nonatomic, retain) IBOutlet UIButton* done;

-(IBAction) color_select_1_clicked:(id)sender ;
-(IBAction) color_select_2_clicked:(id)sender ;
-(IBAction) color_select_3_clicked:(id)sender ;
-(IBAction) color_select_4_clicked:(id)sender ;
-(IBAction) color_select_5_clicked:(id)sender ;
-(IBAction) color_select_done_clicked:(id)sender ;

@end

