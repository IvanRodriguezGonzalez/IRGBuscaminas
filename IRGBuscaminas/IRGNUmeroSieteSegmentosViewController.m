//
//  IRGNUmeroSieteSegmentosViewController.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 12/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGNUmeroSieteSegmentosViewController.h"
#import "IRGSieteSegmentos.h"

@interface IRGNUmeroSieteSegmentosViewController ()
@property (nonatomic) NSInteger anchoDelSegmento;
@property (nonatomic) IRGSieteSegmentos *vistaSieteSegmentos;


@end

@implementation IRGNUmeroSieteSegmentosViewController

-(void)loadView{
    CGRect frameDeLaVentana = [UIApplication sharedApplication].keyWindow.frame ;
    CGFloat anchoVentana = frameDeLaVentana.size.width;
    CGFloat altoVentana = frameDeLaVentana.size.height;
    
    CGFloat anchoVista = anchoVentana/3;
    
    CGRect frame = CGRectMake(anchoVista,(altoVentana-anchoVista)/2,anchoVista,anchoVista);
    IRGSieteSegmentos * vista = [[IRGSieteSegmentos alloc]initWithFrame:frame];
    vista.backgroundColor =[UIColor clearColor];
    
    self.view = vista;
    self.vistaSieteSegmentos = vista;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Accesors

-(void) setValorADibujar:(NSInteger)valorADibujar{
    _valorADibujar = valorADibujar;
    [self.vistaSieteSegmentos dibujarNumero:valorADibujar];
}

@end
