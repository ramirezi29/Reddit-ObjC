//
//  IRPost.m
//  RedditObjC
//
//  Created by Ivan Ramirez on 9/19/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

#import "IRPost.h"

@implementation IRPost


//This is for creating instance of POST
-(instancetype)initWithTitle:(NSString *)title commentCount:(NSNumber *)commentCount ups:(NSNumber *)ups imageUrl:(NSString *)imageUrl
{
    self = [super init];
    if (self) {
        _title = [title copy];
        _commentCount = commentCount;
        _ups = ups;
        _imageUrl = imageUrl;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    //every post lives inside a data Node
    NSDictionary *dataDictionary = dictionary[@"data"];

    //now that we got our dataKeys at the bottom of the page, we can now write this line of code below
    
    NSString *imageUrl = dataDictionary[[IRPost imageKey]];
    NSString *title = dataDictionary[[IRPost titleKey]];
    NSNumber *commentCount = dataDictionary[[IRPost commentCountKey]];
    NSNumber *ups = dataDictionary[[IRPost upsKey]];
    
    return [self initWithTitle:title commentCount:commentCount ups:ups imageUrl:imageUrl];
}

//These are like our private keys
+(NSString *)titleKey
{
    return @"title";
}

+(NSString *)commentCountKey
{
    return @"num_comments";
}

+(NSString *)upsKey
{
    return @"ups";
}

+(NSString *)imageKey;
{
    return @"thumbnail";
}

@end
