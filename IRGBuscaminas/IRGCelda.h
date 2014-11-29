//
//  IRGCelda.h
//  IRGDibujar
//
//  Created by Ivan Rodriguez Gonzalez on 26/10/14.
//  Copyright (c) 2014 IvanRodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IRGCelda : UIView

#pragma mark - Propiedades publicas

@property (nonatomic) UILabel * numeroDeMinasAlrededor;
@property (nonatomic) UIImageView *imagenDeMina;
@property (nonatomic) bool procesada;

#pragma mark - Inicializadores
//designated initializer
- (instancetype) initWithFrame:(CGRect)frame
                     procesada:(bool) procesada;

#pragma mark - Metodos publicos
-(void) dibujarBorderCeldaProcesada;

@end
