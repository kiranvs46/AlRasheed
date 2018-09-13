//
//  BaseAPI.m
//  BaseAPI
//
//  Created by Robin Thomas on 09/07/15.
//  Copyright (c) 2015 Qburst. All rights reserved.
//

#import "BaseAPI.h"
#import "AFNetworking.h"
#import "APIErrorTypeResponse.h"
#import "APIErrorTypeNetwork.h"
#import "APIErrorTypeNone.h"
#import "AFNetworkActivityIndicatorManager.h"

@implementation BaseAPI

#pragma mark - Request Configuration - Override in subclass

/**
 * Implement this method to configure the base url
 *
 * @return String - base url pointing to the web service
 */
- (NSString *)baseUrl {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override the BaseAPI method -(NSString *)%@ in %@", NSStringFromSelector(_cmd), NSStringFromClass([self class])]
                                 userInfo:nil];
}

/**
 * Implement this method to configure the request url or method
 *
 * @return String - request url
 */
-(NSString *)requestUrl {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override the BaseAPI method -(NSString *)%@ in %@", NSStringFromSelector(_cmd), NSStringFromClass([self class])]
                                 userInfo:nil];
}

/**
 * Implement this method to configure the response class
 *
 * @return Class<? extends BaseResponseBean>
 */
-(Class)responseClass {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override the BaseAPI method -(Class)%@ in %@", NSStringFromSelector(_cmd), NSStringFromClass([self class])]
                                 userInfo:nil];
}

/**
 * Return false to prevent the baseUrl from being prepended to the requestUrl
 *
 * @return boolean
 */
-(BOOL)shouldPrependBaseUrl {
    return true;
}

/**
 * Override this method to customize the request timeout duration.
 *
 * @return int - timeout duration in seconds
 */
-(NSInteger)requestTimeOutInSeconds {
    return REQUEST_TIMEOUT_IN_SECONDS;
}

/**
 * Override this method to return the authentication params as dictionary
 * Keys
 * username
 * password
 *
 * @return NSDictionary - Authentication header
 */
-(NSDictionary *)authenticationDictionary {
    return nil;
}

/**
 * Override this method to return request headers as key/value pairs
 *
 * @return NSDictionary - Headers dictionary
 */
-(NSDictionary *)requestHeaders{
    return nil;
}

/**
 * Implement this method to configure the request type:
 * GET      - RequestTypeGET
 * POST     - RequestTypePOST
 * PUT      - RequestTypePUT
 * DELETE   - RequestTypeDELETE
 *
 * @return WebServiceMethod
 */
-(RequestType)requestType {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override the BaseAPI method -(RequestType)%@ in %@", NSStringFromSelector(_cmd), NSStringFromClass([self class])]
                                 userInfo:nil];
}

#pragma mark - Response processors - Override in subclass
-(id)processSuccessResponse:(NSDictionary *)response {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override the BaseAPI method -(id)%@ in %@", NSStringFromSelector(_cmd), NSStringFromClass([self class])]
                                 userInfo:nil];
}

#pragma mark - Web Requests
-(void)performRequestWithObject:(BaseAPIModel *)object andCompletion:(RequestCompletion)completion {
    self.requestCompletion = completion;
    //[self performRequestWithDictionary:[object objectToDictionary] andCompletion:completion];
}

-(void)performRequestWithDictionary:(NSDictionary *)dictionary andCompletion:(RequestCompletion)completion {
    self.requestCompletion = completion;
    if(dictionary == nil)// to handle empty requests
        dictionary = [NSDictionary dictionary];
    [self performRequestWithUrl:[self buildUrl] andParams:dictionary];
}

#pragma mark - Utility
-(NSString *)buildUrl {
    NSMutableString *url = [[NSMutableString alloc] init];
    
    if([self shouldPrependBaseUrl]) {
        [url appendString:[self baseUrl]];
    }
    [url appendString:[self requestUrl]];
    return url;
}


#pragma mark - AFNetworking calls
/**
 Result of the the web request
 
 1. Status code
 2. Response dictionary (Success block)
 OR
 3. NSError (Failure block)
 
 Success block
 =============
 1. Create an object of type [self responseClass] from the response.
 2. Check for errors in the response object - Create a APIError object
 
 Failure block
 =============
 1. Get the http status code
 2. Get the error message from NSError
 3. Create a WebServiceError object from the http status code
 3. Create an object of type [self responseClass] using the status code and
 
 Finally return the object of type [self responseClass]
 */

-(void)performRequestWithUrl:(NSString *)url andParams:(NSDictionary *)params {
    if([SLUtility isNetworkAvailable]) {
        // Internet connection available; Do the request
        if(SHOULD_LOG) {
            NSLog(@"Performing request...");
            NSLog(@"URL: %@", url);
            NSLog(@"Params: %@", params);
        }
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [[AFNetworkActivityIndicatorManager sharedManager]setEnabled:YES];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        // Set server authentication params if required
        if([self authenticationDictionary]) {
            NSString *username = nil;
            NSString *password = nil;
            
            if([[[self authenticationDictionary] allKeys] containsObject:AuthenticationUsernameKey])
                username = [[self authenticationDictionary] objectForKey:AuthenticationUsernameKey];
            if([[[self authenticationDictionary] allKeys] containsObject:AuthenticationPasswordKey])
                password = [[self authenticationDictionary] objectForKey:AuthenticationPasswordKey];
            
            if(username && password) {
                [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:username password:password];
            }
        }
        
        // Set other request headers
        NSDictionary *requestHeaders = [self requestHeaders];
        if(SHOULD_LOG) {
            NSLog(@"Request Headers: %@", requestHeaders);
        }
        if(requestHeaders) {
            for(NSString *key in [requestHeaders allKeys]) {
                [manager.requestSerializer setValue:[requestHeaders objectForKey:key] forHTTPHeaderField:key];
            }
        }
        
        // Set request timeout duration
        [manager.requestSerializer setTimeoutInterval:[self requestTimeOutInSeconds]];
        
        // Success Block
        void (^successBlock)(NSURLSessionTask *task, id response) = ^(NSURLSessionTask *task, id response) {
            if(SHOULD_LOG) {
                NSLog(@"Request Success");
                NSLog(@"URL: - %@", url);
                NSLog(@"Response: %@", response);
                NSLog(@"Response Headers: %@", [task response]);
            }
            
            if(self.requestCompletion) {
                // Create the response object
                id responseObject = [self processSuccessResponse:response];
                
                // Create a WebServiceError
                APIError *error = [responseObject getAPIError];
                
                if ([error isKindOfClass:[APIErrorTypeNone class]]) {
                    error = nil;
                }
                
                // Send the response object and WebServiceError to the requestor
                self.requestCompletion(responseObject, error);
            }
        };    
        
        // Failure Block
        void (^failureBlock)(NSURLSessionTask *task, NSError *error) = ^(NSURLSessionTask *task, NSError *error) {
            NSData *errorData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
            
            if(SHOULD_LOG) {
                NSString *serializedData = [[NSString alloc] initWithData:errorData encoding:NSUTF8StringEncoding];
                NSLog(@"Request Failed");
                NSLog(@"Status Code: %ld", [(NSHTTPURLResponse*)[task response] statusCode]);
                NSLog(@"Error: %@", error);
                NSLog(@"URL:- %@", url);
                NSLog(@"Failure Response: %@", serializedData);
            }
            
            if(self.requestCompletion) {
                // Translate the http status code to a APIError
                // Sometimes the request fails but the HTTP status code is 200; so substitute the 200 with 404
                NSInteger statusCode = [(NSHTTPURLResponse*)[task response] statusCode]  == HTTP_STATUS_OK ? HTTP_STATUS_NOT_FOUND : [(NSHTTPURLResponse*)[task response] statusCode];
                
                // Create APIError object based on http status code
                APIError *httpError = [APIError initWithHttpStatusCode:statusCode];
                
                // Get the response data if any
                NSData *errorData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
                id responseObject = nil;
                
                if(errorData) {
                    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:errorData
                                                                                       options:NSJSONReadingMutableContainers
                                                                                         error:nil];
                    if(responseDictionary) {
                        // Convert the response dictionary to an object
                        responseObject = [self processSuccessResponse:responseDictionary];
                        // Detect any API errors in the response
                        APIError *apiError = [responseObject getAPIError];
                        
                        if(apiError) {
                            if ([APIError isSubclassOfClass:[APIErrorTypeResponse class]]) {
                                // Use the apiError if the response is valid.
                                httpError = apiError;
                            } else if ([apiError isKindOfClass:[APIErrorTypeNone class]]) {
                                error = nil;
                            }
                            else {
                                responseObject = nil;
                            }
                        }
                    }}
                
                self.requestCompletion(responseObject, httpError);
            }
        };
        
        // Perform the request
        switch ([self requestType]) {
            case RequestTypeGET:
                [manager GET:url parameters:params progress:nil success:successBlock failure:failureBlock];
                break;
            case RequestTypePOST:
                [manager POST:url parameters:params progress:nil success:successBlock failure:failureBlock];
                break;
            case RequestTypePUT:
                [manager PUT:url parameters:params success:successBlock failure:failureBlock];
                break;
            case RequestTypeDELETE:
                [manager DELETE:url parameters:params success:successBlock failure:failureBlock];
                break;
            default:
                break;
        }
    } else {
        // No internet connection available; Send an error response
        if(self.requestCompletion) {
            APIError *error = [[APIErrorTypeNetwork alloc] init];
            error.message = [APIError getMessageForErrorType:error];
            self.requestCompletion(nil, error);
        }
    }
}

@end
