//
//  IRGLienzo.h
//  IRGDibujar
//
//  Created by Leticia Vila Sexto on 1/11/14.
//  Copyright (c) 2014 IvanRodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IRGLienzo : NSObject
#pragma mark - Propiedades publicas

@property (nonatomic) NSInteger filasDelLienzo;
@property (nonatomic) NSInteger columnasDelLienzo;
@property (nonatomic) NSInteger altoCelda;
@property (nonatomic) NSInteger anchoCelda;


#pragma mark - Inicializadores
//designated initializer
+ (instancetype) sharedLienzo;


@end
