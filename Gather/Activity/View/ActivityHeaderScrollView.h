//
//  ActivityHeaderScrollView.h
//  Gather
//
//  Created by chen on 12/4/15.
//  Copyright © 2015 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityHeaderScrollView : UIView

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end
