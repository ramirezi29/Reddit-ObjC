//
//  IRPost.h
//  RedditObjC
//
//  Created by Ivan Ramirez on 9/19/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IRPost : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *commentCount;
@property (nonatomic, readonly) NSNumber *ups;
@property (nonatomic, readonly, copy) NSString *imageUrl;

//SWIFT: memberwise initilizer
//This is like our prototcl
-(instancetype)initWithTitle:(NSString *)title commentCount:(NSNumber *)commentCount ups:(NSNumber *)ups imageUrl:(NSString *)imageUrl;

//init for the dictionary
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
