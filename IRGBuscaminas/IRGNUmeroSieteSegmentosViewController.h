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
@property (nonatomic) NSInteger valor;
-(void) dibujarNumero:(IRGSieteSegmentos *)sender;

@end
