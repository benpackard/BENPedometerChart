//
//  BENPedometerBar.m
//  BENPedometerChartDemo
//
//  Created by Ben Packard on 4/10/14.
//  Copyright (c) 2014 Ben Packard. All rights reserved.
//

#import "BENPedometerBarView.h"

@implementation BENPedometerBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
	{
		self.bar = [[UIView alloc] init];
		self.bar.translatesAutoresizingMaskIntoConstraints = NO;
		self.bar.backgroundColor = [UIColor darkGrayColor];
		[self addSubview:self.bar];
		
		self.underLabel = [[UILabel alloc] init];
		self.underLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.underLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:16];
		self.underLabel.textAlignment = NSTextAlignmentCenter;
		self.underLabel.adjustsFontSizeToFitWidth = YES;
		self.underLabel.minimumScaleFactor = 0.7;
		[self addSubview:self.underLabel];
		
		self.overLabel = [[UILabel alloc] init];
		self.overLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.overLabel.font = [UIFont fontWithName:@"AvenirNext-Bold" size:16];
		self.overLabel.textAlignment = NSTextAlignmentCenter;
		self.overLabel.adjustsFontSizeToFitWidth = YES;
		self.overLabel.minimumScaleFactor = 0.5;
		[self addSubview:self.overLabel];
		
		self.innerLabel = [[UILabel alloc] init];
		self.innerLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.innerLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:16];
		self.innerLabel.textColor = [UIColor whiteColor];
		self.innerLabel.textAlignment = NSTextAlignmentCenter;
		self.innerLabel.adjustsFontSizeToFitWidth = YES;
		self.innerLabel.minimumScaleFactor = 0.5;
		[self.bar addSubview:self.innerLabel];

		NSDictionary *views = @{@"bar":self.bar, @"under":self.underLabel, @"over":self.overLabel, @"inner":self.innerLabel};
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[bar]|" options:0 metrics:nil views:views]];
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-4-[over]-4-|" options:0 metrics:nil views:views]];
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-4-[under]-4-|" options:0 metrics:nil views:views]];
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[over][bar]-5-[under]|" options:0 metrics:nil views:views]];
		[self.bar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-4-[inner]-4-|" options:0 metrics:nil views:views]];
		[self.bar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[inner]|" options:0 metrics:nil views:views]];
		
    }
    return self;
}

@end
