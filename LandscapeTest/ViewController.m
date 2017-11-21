//
//  ViewController.m
//  LandscapeTest
//
//  Created by Perfect on 2017/11/17.
//  Copyright © 2017年 Alex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self scrollViewSetting];
    [self sliderSetting];
    [UIView animateWithDuration:5 animations:^{
        self.scrollView.alpha = 0.2;
    }];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - Slider

- (void)sliderSetting {
    CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI_2);
    self.slider.transform = trans;
    
    [self.slider setThumbImage:[UIImage imageNamed:@"imgU"] forState:UIControlStateNormal];
//    self.slider.maximumTrackTintColor = [UIColor blackColor];
    self.slider.minimumTrackTintColor = [UIColor blackColor];
    [self.slider setMaximumTrackImage:[UIImage imageNamed:@"moxa"] forState:UIControlStateNormal];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    [self.scrollView setContentOffset:CGPointMake(0, sender.value * self.scrollView.contentSize.height) animated:YES];

}

- (IBAction)sliderPressedAndDraging:(UISlider *)sender {
    CGFloat scrollViewContentOffsetY = (self.scrollView.contentSize.height - self.view.bounds.size.height) * sender.value;
    [self.scrollView setContentOffset:CGPointMake(0, scrollViewContentOffsetY) animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewSetting {
    NSArray *colors = @[[UIColor redColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor], [UIColor purpleColor]];
    
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)*colors.count);
    
    for(int i = 0; i<colors.count; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, i*self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height)];
        view.backgroundColor = colors[i];
        [self.scrollView addSubview:view];
    }
    self.scrollView.userInteractionEnabled = NO;
}


@end
