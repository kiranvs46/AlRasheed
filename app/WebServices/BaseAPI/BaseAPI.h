//
//  BaseAPI.h
//  BaseAPI
//
//  Created by Robin Thomas on 09/07/15.
//  Copyright (c) 2015 Qburst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAPIModel.h"
#import "BaseAPIResponse.h"
#import "BaseAPIConstants.h"
#import "APIError.h"

#pragma mark - Request Types
typedef enum {
    RequestTypeGET,
    RequestTypePOST,
    RequestTypePUT,
    RequestTypeDELETE,
}RequestType;

#pragma mark - RequestCompletion
typedef void (^RequestCompletion)(id response, APIError *error);

@interface BaseAPI : NSObject

@property (nonatomic, copy) RequestCompletion requestCompletion;

#pragma mark - Request Configuration - Override in subclass
-(NSString *)baseUrl;
-(BOOL)shouldPrependBaseUrl;

-(NSString *)requestUrl;
-(RequestType)requestType;
-(NSInteger)requestTimeOutInSeconds;

-(NSDictionary *)authenticationDictionary;
-(NSDictionary *)requestHeaders;

-(Class)responseClass;

#pragma mark - Response processors - Override in subclass
-(id)processSuccessResponse:(NSDictionary *)response;

#pragma mark - Web Requests
-(void)performRequestWithObject:(BaseAPIModel *)object andCompletion:(RequestCompletion)completion;
-(void)performRequestWithDictionary:(NSDictionary *)dictionary andCompletion:(RequestCompletion)completion;
@end
