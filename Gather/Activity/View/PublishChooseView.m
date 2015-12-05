//
//  PublishChooseView.m
//  Gather
//
//  Created by chen on 12/1/15.
//  Copyright © 2015 chen. All rights reserved.
//

#import "PublishChooseView.h"

@implementation PublishChooseView

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
-(instancetype)initWithFrame:(CGRect)frame
{
    self = (PublishChooseView *)([[NSBundle mainBundle] loadNibNamed:@"PublishChooseView" owner:self options:nil][0]);
    if (self) {
        self.frame = frame;
        [self addEvents];
    }
    return self;
}
#pragma clang diagnostic pop

-(void)addEvents
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchBackground)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
}

-(void)touchBackground
{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}




@end
