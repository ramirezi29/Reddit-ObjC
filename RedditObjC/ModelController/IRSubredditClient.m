//
//  IRSubredditClient.m
//  RedditObjC
//
//  Created by Ivan Ramirez on 9/20/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

#import "IRSubredditClient.h"

@implementation IRSubredditClient

+(NSURL *)baseUrl {
    return [NSURL URLWithString: @"https://www.reddit.com/r/"];
    
}

/*
 ----
 Fetch Reqeust two steps
 1. Construct the URL
 2. Call DataTAsk on that URL, Serialize the data, complete, than call resume
 ---
 */
+(void)fetchAllSubRedditsForTitle:(NSString *)title withBlock:(void (^)(NSArray<IRPost *> * _Nullable posts))block{
    
    //1. construct the URL
    
    NSURL *url = [[[IRSubredditClient baseUrl] URLByAppendingPathComponent:title] URLByAppendingPathExtension:@"json"];
    
    NSLog(@"%@", [url absoluteString]);
    
    
    //call data task
    //Handling error, print response, check if theres data
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            
            NSLog(@"Error in %s, %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            
            block(nil);
            return;
        }
        
        NSLog(@"%@", response);
        
        if (!data){
            NSLog(@"No Data Available");
            block(nil);
            return;
        }
        // need the fragment to avoid errors in json reading
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error: &error];
        
        NSDictionary *dataDictionary = jsonDictionary[@"data"];
        NSArray *childrenArray = dataDictionary[@"children"];
        //emtpy array
        //PART 1 of line of code
        NSMutableArray *postArray = [[NSMutableArray alloc] init];
        
        //for loop to get the properties
        
        for (NSDictionary *postDictionary in childrenArray){
            // we wrote an init already to dig into the dictionary so we'll go to a next step
            IRPost *post = [[IRPost alloc] initWithDictionary:postDictionary];
            //PART 2 of the arrray code
            [postArray addObject:post];
        }
        block(postArray);
    }] resume ];
}

+ (void)fetchImageDataForUrl:(NSString *)imageUrlString withBlock:(void (^)(UIImage * _Nullable))block{
    
    //1)Construct the URL
    NSURL *url = [NSURL URLWithString:imageUrlString];
    NSLog(@"%@", [url absoluteString]);
    
    //2) DataTask, serialize, complete, resume
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            
            NSLog(@"Error in %s, %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            block(nil);
            return;
        }
        
        NSLog(@"%@", response);
        
        if (!data){
            NSLog(@"No Data Available");
            block(nil);
            return;
        }
        
        UIImage *photo = [UIImage imageWithData:data];
        block(photo);
        
    }] resume];
}
@end

