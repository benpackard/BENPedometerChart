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
		self.underLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Medium" size:12];
		self.underLabel.textAlignment = NSTextAlignmentCenter;
		self.underLabel.backgroundColor = [UIColor whiteColor];
		[self addSubview:self.underLabel];
		
		self.overLabel = [[UILabel alloc] init];
		self.overLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.overLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:12];
		self.overLabel.textAlignment = NSTextAlignmentCenter;
		self.overLabel.backgroundColor = [UIColor whiteColor];
		[self addSubview:self.overLabel];
		
		self.innerLabel = [[UILabel alloc] init];
		self.innerLabel.translatesAutoresizingMaskIntoConstraints = NO;
		self.innerLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Medium" size:11];
		self.innerLabel.textColor = [UIColor whiteColor];
		self.innerLabel.textAlignment = NSTextAlignmentCenter;
		[self.bar addSubview:self.innerLabel];
		
		NSDictionary *views = @{@"bar":self.bar, @"under":self.underLabel, @"over":self.overLabel, @"inner":self.innerLabel};
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[bar]|" options:0 metrics:nil views:views]];
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[over]|" options:0 metrics:nil views:views]];
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-4-[under]-4-|" options:0 metrics:nil views:views]];
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[over][bar]-5-[under]|" options:0 metrics:nil views:views]];
		[self.bar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-4-[inner]-4-|" options:0 metrics:nil views:views]];
		[self.bar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[inner]|" options:0 metrics:nil views:views]];
    }
    return self;
}

@end
