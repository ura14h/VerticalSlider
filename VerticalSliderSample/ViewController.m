//
//  ViewController.m
//  VerticalSliderSample
//
//  Created by Hiroki Ishiura on 2013/11/17.
//  Copyright (c) 2013 Hiroki Ishiura. All rights reserved.
//

#import "VerticalSlider.h"
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISlider *hSlider;
@property (weak, nonatomic) IBOutlet VerticalSlider *vSlider;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	[self.hSlider setMinimumValueImage:[UIImage imageNamed:@"SliderMin"]];
	[self.hSlider setMaximumValueImage:[UIImage imageNamed:@"SliderMax"]];
	[self.hSlider setThumbImage:[UIImage imageNamed:@"SliderThumb"] forState:UIControlStateNormal];
	
	[self.vSlider setMinimumValueImage:[UIImage imageNamed:@"SliderMin"]];
	[self.vSlider setMaximumValueImage:[UIImage imageNamed:@"SliderMax"]];
	[self.vSlider setThumbImage:[UIImage imageNamed:@"SliderThumb"] forState:UIControlStateNormal];
}

- (IBAction)valueDidChanged:(UISlider *)sender
{
	self.label.text = [NSString stringWithFormat:@"%f", sender.value];
}

@end
