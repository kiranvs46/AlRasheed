//
//  BaseAPIModel.h
//  BaseAPI
//
//  Created by Robin Thomas on 09/07/15.
//  Copyright (c) 2015 Qburst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAPIConstants.h"
#import "APIError.h"

@interface BaseAPIModel : NSObject

- (id)initWithDictionary:(NSDictionary *)params ;
- (NSDictionary*)objectToDictionary;

@end
