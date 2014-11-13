//
//  IRGNUmeroSieteSegmentosViewController.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 12/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IRGSieteSegmentos;

@interface IRGNUmeroSieteSegmentosViewController : UIViewController
@property (nonatomic) NSInteger valorADibujar;

@property(nonatomic) NSInteger porcentajeDetTansparencia;
@property(nonatomic) bool conEfecto3D;

//designated initializer
-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                      withFrame:(CGRect) frame;
@end
