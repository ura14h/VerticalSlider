#import "VerticalSlider.h"

@implementation VerticalSlider

- (id)initWithCoder:(NSCoder *)decoder
{
	self = [super initWithCoder:decoder];
	if (self) {
		[self initVerticalSlider];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self initVerticalSlider];
	}
	return self;
}

- (void)initVerticalSlider
{
	CGRect rect = self.frame;
	self.transform = CGAffineTransformMakeRotation(-M_PI_2);
	self.frame = rect;
	
	[self setMinimumValueImage:self.minimumValueImage];
	[self setMaximumValueImage:self.maximumValueImage];
	[self setThumbImage:[self thumbImageForState:UIControlStateNormal] forState:UIControlStateNormal];
	[self setThumbImage:[self thumbImageForState:UIControlStateHighlighted] forState:UIControlStateHighlighted];
	[self setThumbImage:[self thumbImageForState:UIControlStateSelected] forState:UIControlStateSelected];
	[self setThumbImage:[self thumbImageForState:UIControlStateDisabled] forState:UIControlStateDisabled];
}

- (void)setMinimumValueImage:(UIImage *)image
{
	[super setMinimumValueImage:[self rotatedImage:image]];
}

- (void)setMaximumValueImage:(UIImage *)image
{
	[super setMaximumValueImage:[self rotatedImage:image]];
}

- (void)setThumbImage:(UIImage *)image forState:(UIControlState)state
{
	[super setThumbImage:[self rotatedImage:image] forState:state];
}

- (UIImage *)rotatedImage:(UIImage *)image
{
	if (!image) {
		return nil;
	}
	UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.height, image.size.width), NO, image.scale);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextRotateCTM(context, M_PI_2);
	[image drawAtPoint:CGPointMake(0.0, -image.size.height)];
	return UIGraphicsGetImageFromCurrentImageContext();
}

@end
