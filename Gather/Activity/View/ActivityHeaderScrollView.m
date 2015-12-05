//
//  ActivityHeaderScrollView.m
//  Gather
//
//  Created by chen on 12/4/15.
//  Copyright © 2015 chen. All rights reserved.
//

#import "ActivityHeaderScrollView.h"

@interface ActivityHeaderScrollView () <UIScrollViewDelegate>

@end


@implementation ActivityHeaderScrollView

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
-(instancetype)initWithFrame:(CGRect)frame
{
    self = (ActivityHeaderScrollView *)([[NSBundle mainBundle] loadNibNamed:@"ActivityHeaderScrollView" owner:self options:nil][0]);
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor redColor];
        [self initSubviews:frame];
    }
    return self;
}
#pragma clang diagnostic pop


-(void)initSubviews:(CGRect)frame
{
    _mainScrollView.delegate = self;
    _mainScrollView.contentSize = CGSizeMake(frame.size.width * 3, frame.size.height);
    for (int i=0; i<3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width * i, 0, frame.size.width, frame.size.height)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i+1]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [_mainScrollView addSubview:imageView];
    }
    _pageControl.numberOfPages = 3;
}

#pragma mark - scrollView delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;
    _pageControl.currentPage = page;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"");
}


@end
