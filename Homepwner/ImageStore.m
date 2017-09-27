//
//  ImageStore.m
//  Homepwner
//
//  Created by Linquas on 25/09/2017.
//  Copyright © 2017 Linquas. All rights reserved.
//

#import "ImageStore.h"
#import <UIKit/UIKit.h>


@interface ImageStore ()
@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end


@implementation ImageStore
+ (instancetype)sharedStore {
    static ImageStore *sharedStore = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[ImageStore alloc] initPrivate];
    });

    return sharedStore;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use sharedStore" userInfo:nil];
}

//designated initializer
- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key {
    self.dictionary[key] = image;
}
- (UIImage *)imageForKey:(NSString *)key {
    return self.dictionary[key];
}
- (void)deleteImageForKey:(NSString *)key {
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}


@end
