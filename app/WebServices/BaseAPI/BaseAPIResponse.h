//
//  BaseAPIResponse.h
//  BaseAPI
//
//  Created by Robin Thomas on 16/07/15.
//  Copyright (c) 2015 Qburst. All rights reserved.
//

#import "BaseAPIModel.h"

@interface BaseAPIResponse : BaseAPIModel

-(APIError *)getAPIError;

@end
