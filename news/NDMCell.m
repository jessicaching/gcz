//
//  NDMCell.m
//  gcz
//
//  Created by Jessica on 15/4/19.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import "NDMCell.h"

@implementation NDMCell

- (void)awakeFromNib {
    // Initialization code
    mScrollView.contentSize = CGSizeMake(CGRectGetWidth(mScrollView.frame) * kFrameWRatio * 5, CGRectGetHeight(mScrollView.frame));
    mTextView.text = @"(1/5)当地时间4月18日，日本东京，日本首相安倍晋三和夫人安倍昭惠在新宿御园内举办赏樱活动，数千客人被邀请参加，安倍与众人合影。";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSInteger)getValidNextPageIndexWithPageIndex:(NSInteger)pageIndex;
{
    if(pageIndex == -1) {
        return 5 - 1;
    } else if (pageIndex == 5) {
        return 0;
    } else {
        return pageIndex;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int contentOffsetX = scrollView.contentOffset.x;
    int width =  CGRectGetWidth(mScrollView.frame);
    int currentPageIndex = contentOffsetX / width;
    if (currentPageIndex == 0) {
        mTextView.text = @"(1/5)当地时间4月18日，日本东京，日本首相安倍晋三和夫人安倍昭惠在新宿御园内举办赏樱活动，数千客人被邀请参加，安倍与众人合影。";
    } else if (currentPageIndex == 1) {
        mTextView.text = @"(2/5)图为当地时间4月18日，日本东京，日本首相安倍与少女组合Momoiro Clover Z成员一同摆姿势合影。";
    } else if (currentPageIndex == 2) {
        mTextView.text = @"(3/5)图为活动现场。";
    } else if (currentPageIndex == 3) {
        mTextView.text = @"(4/5)图为活动现场。";
    } else {
        mTextView.text = @"(5/5)图为安倍与参加活动的民众握手。";
    }
}
@end
