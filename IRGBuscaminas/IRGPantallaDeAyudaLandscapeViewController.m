//
//  IRGPantallaDeAyudaLandscapeViewController.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 27/12/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGPantallaDeAyudaLandscapeViewController.h"

@interface IRGPantallaDeAyudaLandscapeViewController ()
@property (weak, nonatomic) IBOutlet UIView *vistaPrincipal;

@end

@implementation IRGPantallaDeAyudaLandscapeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.vistaPrincipal.layer.borderWidth = 0;
    self.vistaPrincipal.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.vistaPrincipal.layer.cornerRadius = 10;
    self.vistaPrincipal.layer.masksToBounds = YES;
}
- (IBAction)cerrarVentana:(UIButton *)sender {
    [self.sender accionOcultarVentanaDeAyuda];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
