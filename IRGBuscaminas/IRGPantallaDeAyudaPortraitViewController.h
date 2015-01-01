//
//  IRGPantallaDeAyudaPortraitViewController.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 27/12/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IRGEstadosDelJuego.h"
#import "IRGGestorDeEstados.h"


@interface IRGPantallaDeAyudaPortraitViewController : UIViewController
@property (nonatomic) id<IRGEstadosDelJuego> sender;
@end
