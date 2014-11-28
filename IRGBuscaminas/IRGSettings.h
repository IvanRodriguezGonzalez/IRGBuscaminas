//
//  IRGSettings.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 21/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IRGSettings : NSObject

@property (nonatomic) NSInteger numeroDeMinas;
@property (nonatomic) bool activarAyuda;
@property (nonatomic) NSInteger tiempoDeAyuda;

+ (instancetype) sharedSettings;
-(bool) guardarSettings;


@end
