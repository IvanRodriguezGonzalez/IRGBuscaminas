//
//  IRGPantallaDeAyudaPortraitViewController.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 27/12/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGPantallaDeAyudaPortraitViewController.h"

@interface IRGPantallaDeAyudaPortraitViewController ()
@property (weak, nonatomic) IBOutlet UIView *vistaPrincipal;

@end

@implementation IRGPantallaDeAyudaPortraitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vistaPrincipal.layer.borderWidth = 0;
    self.vistaPrincipal.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.vistaPrincipal.layer.cornerRadius = 10;
    self.vistaPrincipal.layer.masksToBounds = YES;
}

- (IBAction)accionCerrarVentana:(UIButton *)sender {
    [self.sender accionOcultarVentanaDeAyuda];
}
@end
