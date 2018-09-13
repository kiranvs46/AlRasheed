//
//  BaseAPIResponse.m
//  BaseAPI
//
//  Created by Robin Thomas on 16/07/15.
//  Copyright (c) 2015 Qburst. All rights reserved.
//

#import "BaseAPIResponse.h"

@implementation BaseAPIResponse


-(APIError *)getAPIError {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override the BaseAPIResponse method -(APIError *)%@ in %@", NSStringFromSelector(_cmd), NSStringFromClass([self class])]
                                 userInfo:nil];
}


@end
