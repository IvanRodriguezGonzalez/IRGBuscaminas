//
//  IRGVentanaPrincipalViewController.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 6/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IRGCeldaViewController;

@interface IRGVentanaPrincipalViewController : UIViewController
@property (nonatomic) NSInteger altoDelCanvas;

-(void) celdaPulsada:(IRGCeldaViewController *)celdaPulsada;
-(void) celdaDoblePulsada: (IRGCeldaViewController *)celdaDoblePulsada;
-(void) actualizaMinasPendientes;




@end
