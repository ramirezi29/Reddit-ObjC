//
//  IRSubredditClient.h
//  RedditObjC
//
//  Created by Ivan Ramirez on 9/20/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IRPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface IRSubredditClient : NSObject
/*
 ----
 fetch all sub reddits, our user feeds teh search
 ---
 */

//contain the fetch functions
+(void)fetchAllSubRedditsForTitle:(NSString *)title withBlock:(void (^)(NSArray<IRPost *> * _Nullable posts))block;
+(void)fetchImageDataForUrl:(NSString *)imageUrlString withBlock: (void (^)(UIImage * _Nullable photo))block;


@end

NS_ASSUME_NONNULL_END
