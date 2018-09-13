//
//  BaseAPIConstants.h
//  BaseAPI
//
//  Created by Robin Thomas on 09/07/15.
//  Copyright (c) 2015 Qburst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIError.h"

#pragma mark - HTTP Status codes
static NSInteger const HTTP_STATUS_OK                      = 200;
static NSInteger const HTTP_STATUS_CREATED                 = 201;
static NSInteger const HTTP_STATUS_ACCEPTED                = 202;
static NSInteger const HTTP_STATUS_PARTIAL_RESPONSE        = 203;
static NSInteger const HTTP_STATUS_NO_CONTENT              = 204;

static NSInteger const HTTP_STATUS_MOVED                   = 301;
static NSInteger const HTTP_STATUS_FOUND                   = 302;
static NSInteger const HTTP_STATUS_METHOD                  = 303;
static NSInteger const HTTP_STATUS_NOT_MODIFIED            = 303;

static NSInteger const HTTP_STATUS_BAD_REQUEST             = 400;
static NSInteger const HTTP_STATUS_UNAUTHORIZED            = 401;
static NSInteger const HTTP_STATUS_PAYMENT_REQUIRED        = 402;
static NSInteger const HTTP_STATUS_FORBIDDEN               = 403;
static NSInteger const HTTP_STATUS_NOT_FOUND               = 404;

static NSInteger const HTTP_STATUS_INTERNAL_SERVER_ERROR   = 500;
static NSInteger const HTTP_STATUS_NOT_IMPLEMENTED         = 501;
static NSInteger const HTTP_STATUS_SERVICE_OVERLOADED      = 502;
static NSInteger const HTTP_STATUS_GATEWAY_TIMEOUT         = 503;

#pragma mark - Request Timeout
static NSInteger const REQUEST_TIMEOUT_IN_SECONDS          = 90;


#pragma mark - String Constants

@interface BaseAPIConstants : NSObject

#pragma mark - HTTP Error messages
//FOUNDATION_EXPORT NSString *const MessageAuthenticationError;
//FOUNDATION_EXPORT NSString *const MessageInvalidAccountDetails;
//FOUNDATION_EXPORT NSString *const MessageNetworkError;
//FOUNDATION_EXPORT NSString *const MessageRequestError;
//FOUNDATION_EXPORT NSString *const MessageResponseError;
//FOUNDATION_EXPORT NSString *const MessageServerError;
//FOUNDATION_EXPORT NSString *const MessageSessionExpired;
//
//FOUNDATION_EXPORT NSString *const MessageSuccess;
//FOUNDATION_EXPORT NSString *const MessageFailure;

#pragma mark - Server Authentication Keys
FOUNDATION_EXPORT NSString *const AuthenticationUsernameKey;
FOUNDATION_EXPORT NSString *const AuthenticationPasswordKey;

#pragma mark - Debug
FOUNDATION_EXPORT BOOL const SHOULD_LOG;

@end
