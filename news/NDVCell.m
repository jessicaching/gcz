//
//  NDVCell.m
//  gcz
//
//  Created by Jessica on 15/4/19.
//  Copyright (c) 2015年 Jessica. All rights reserved.
//

#import "NDVCell.h"

@implementation NDVCell

- (void)awakeFromNib {
    // Initialization code
    [mWebView setDelegate:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)actionPlay:(UIButton *)sender
{
    sender.hidden = YES;
    NSURL *url = [NSURL URLWithString:@"http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8"];
    //http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8//这里也可以是 mp4
//    http://v.ifeng.com/include/exterior.swf?AutoPlay=false&guid=045b1386-91a8-49cb-bb9b-8ac649844e9b
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [mWebView loadRequest:request];
}
@end
