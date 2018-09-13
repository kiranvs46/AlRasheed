//
//  WebServiceError.m
//  BaseAPI
//
//  Created by Robin Thomas on 09/07/15.
//  Copyright (c) 2015 Qburst. All rights reserved.
//

#import "APIError.h"
#import "BaseAPIConstants.h"
#import "APIErrorTypeNone.h"
#import "APIErrorTypeTimeOut.h"
#import "APIErrorTypeNetwork.h"
#import "APIErrorTypeAuthentication.h"
#import "APIErrorTypeResponse.h"
#import "APIErrorTypeRequest.h"
#import "APIErrorTypeServer.h"
#import "APIErrorTypeGeneric.h"
#import "APIErrorTypeServerOverload.h"
#import "DBError.h"

@implementation APIError

+ (APIError*)initWithHttpStatusCode:(NSInteger )status {
    
    APIError *error = [APIError getErrorObjectForHttpStatus:status];
    error.message = [APIError getMessageForErrorType:error];
    return error;
}

+ (APIError *)initWithDBErrorStatus {
    
    APIError *error = [[DBError alloc] init];
    error.message = [APIError getMessageForErrorType:error];
    return error;
}

/**
 * APIErrorTypes -> Error messages mapping
 * Returns a NETWORK_ERROR_MESSAGE for the GENERIC error.
 *
 * @param error
 * @return NSString - Error Message
 */
+(NSString *)getMessageForErrorType:(APIError*)error {
    NSString *errorMessage = @"";
    if ([error isKindOfClass:[APIErrorTypeNone class]]) {
        errorMessage = @"Success";
    }else if ([error isKindOfClass:[APIErrorTypeResponse class]]) {
        errorMessage = @"Request success. No response from server";
    }else if ([error isKindOfClass:[APIErrorTypeNetwork class]]) {
        errorMessage = @"No internet connection";
    }else if ([error isKindOfClass:[APIErrorTypeRequest class]]) {
        errorMessage = @"Invalid request";
    }else if ([error isKindOfClass:[APIErrorTypeAuthentication class]]) {
        errorMessage = @"Authentication failure";
    }else if ([error isKindOfClass:[APIErrorTypeServer class]]) {
        errorMessage = @"Service unavailable now, please try again later";
    }else if ([error isKindOfClass:[APIErrorTypeServerOverload class]]) {
        errorMessage = @"Service unavailable now, Server overload";
    }else if ([error isKindOfClass:[APIErrorTypeTimeOut class]]) {
        errorMessage = @"Service time out, Server not reachable";
    }else if ([error isKindOfClass:[APIErrorTypeGeneric class]]) {
        errorMessage = @"Server not reachable";
    }else if ([error isKindOfClass:[DBError class]]) {
        errorMessage = @"Something went wrong. Please try again";
    }
    else{
        errorMessage = @"Server not reachable";
    }
    return errorMessage;
}

/**
 * HTTP statuses -> APIErrorTypes mapping
 * If a mapping is not found, returns the GENERIC error
 *
 * @param status
 * @return APIErrorType - Error corresponding to a HTTP status
 */
+ (APIError*)getErrorObjectForHttpStatus:(NSInteger)status {
    switch (status) {
        case HTTP_STATUS_OK:                      return [[APIErrorTypeNone alloc] init];                                                                                   // 200
        case HTTP_STATUS_CREATED:                 return [[APIErrorTypeNone alloc] init];            // 201
        case HTTP_STATUS_NO_CONTENT:              return [[APIErrorTypeResponse alloc] init];        // 204
        case HTTP_STATUS_BAD_REQUEST:             return [[APIErrorTypeRequest alloc] init];         // 400
        case HTTP_STATUS_NOT_FOUND:               return [[APIErrorTypeRequest alloc] init];         // 404
        case HTTP_STATUS_UNAUTHORIZED:            return [[APIErrorTypeAuthentication alloc] init];  // 401
        case HTTP_STATUS_INTERNAL_SERVER_ERROR:   return [[APIErrorTypeServer alloc] init];          // 500
        case HTTP_STATUS_SERVICE_OVERLOADED:      return [[APIErrorTypeServerOverload alloc] init];  // 502
        
        default:                                  return [[APIErrorTypeGeneric alloc] init];         // All others
    }
}


@end