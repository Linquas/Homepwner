//
//  DetailViewController.h
//  Homepwner
//
//  Created by Linquas on 25/09/2017.
//  Copyright © 2017 Linquas. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Item;

@interface DetailViewController : UIViewController

@property (nonatomic, strong) Item *item;
- (instancetype)initForNewItem:(BOOL)isNew;
@property (nonatomic, copy) void (^dissmissBlock)(void);
@end
