
@interface custom_button : UIButton {
	NSString* path;
}

@property (nonatomic, retain) NSString* path;

- (void)setImagePath:(NSString*)path;

@end
