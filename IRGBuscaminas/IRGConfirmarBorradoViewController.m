//
//  IRGConfirmarBorradoViewController.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 20/12/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGConfirmarBorradoViewController.h"
#import "IRGMejoresTiempos.h"

@interface IRGConfirmarBorradoViewController ()
@property (weak, nonatomic) IBOutlet UIView *vistaVentanaDeAviso;

@end

@implementation IRGConfirmarBorradoViewController

#pragma mark - overrides

-(void) viewDidLoad{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deviceOrientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
    self.vistaVentanaDeAviso.layer.borderWidth = 1;
    self.vistaVentanaDeAviso.layer.borderColor = [UIColor blackColor].CGColor;
    self.vistaVentanaDeAviso.layer.cornerRadius = 10;
    self.vistaVentanaDeAviso.layer.masksToBounds = YES;

}


#pragma mark - Navigation
- (IBAction)accionCerrarVentana:(id)sender {
    [self.view removeFromSuperview];
}

- (IBAction)accionBorrarHistorial:(id)sender {
    [[IRGMejoresTiempos sharedMejoresTiempos] borrarMejoresTiempos];
    [self.view removeFromSuperview];
    [self.sender cerrarVentana];

}

-(void) deviceOrientationDidChange:(NSNotification *)sender{
    
    CGRect frameConfirmarBorrado = [[UIApplication sharedApplication] keyWindow].frame;
    self.view.frame = frameConfirmarBorrado;
    
    self.view.center = CGPointMake([[UIApplication sharedApplication] keyWindow].frame.size.width/2,[[UIApplication sharedApplication] keyWindow].frame.size.height/2);
}

@end
