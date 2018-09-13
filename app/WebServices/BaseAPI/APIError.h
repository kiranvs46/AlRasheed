//
//  WebServiceError.h
//  BaseAPI
//
//  Created by Robin Thomas on 09/07/15.
//  Copyright (c) 2015 Qburst. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *
 * All errors (http errors and errors returned from the server) are abstracted to the following 6 types.
 * A web service operation is a success when the WebServiceError returned is equal to WebServiceErrorNone.
 *
 */
//typedef enum {
//    APIErrorTypeNone,              // The request was a SUCCESS.
//    APIErrorTypeTimeOut,           // The request timed out.
//    APIErrorTypeNetwork,           // There was a problem with the network connection.
//    APIErrorTypeAuthentication,    // The server returned an authentication error.
//    APIErrorTypeResponse,          // There is a problem with the response format or we got an empty response.
//    APIErrorTypeRequest,           // There was a problem with the request format.
//    APIErrorTypeServer,            // Internal server error.
//    APIErrorTypeGeneric,           // Couldn't detect what went wrong, but something did go wrong.s
//    DBError                        // Error while fetching data from DB
//} APIErrorType;

@interface APIError : NSObject

@property (nonatomic) NSInteger code;
@property (nonatomic, strong) NSString *message;

+ (APIError*)getErrorObjectForHttpStatus:(NSInteger)status;
+ (APIError*)initWithHttpStatusCode:(NSInteger )status;
+ (APIError *)initWithDBErrorStatus;
+ (NSString *)getMessageForErrorType:(APIError*)error;


@end