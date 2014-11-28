//
//  IRGSettingsViewController.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 17/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGSettingsViewController.h"
#import "IRGSettings.h"

@interface IRGSettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numeroDeMinas;
@property (weak, nonatomic) IBOutlet UITextField *tiempoDeAyuda;
@property (weak, nonatomic) IBOutlet UISegmentedControl *activarAyuda;
@property (weak, nonatomic) IBOutlet UIView *vistaDatos;
@property (nonatomic) UIViewController * controllerPrincipal;

@end

@implementation IRGSettingsViewController

-(instancetype) init{
    self = [super init];
    self.view.frame = [[UIScreen mainScreen] applicationFrame];
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addSubview:self.view];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numeroDeMinas.text = [NSString stringWithFormat:@"%d",[IRGSettings sharedSettings].numeroDeMinas];
    self.tiempoDeAyuda.text = [NSString stringWithFormat:@"%d",[IRGSettings sharedSettings].tiempoDeAyuda];
    self.vistaDatos.layer.borderWidth = 1;
    self.vistaDatos.layer.borderColor = [UIColor blackColor].CGColor;
    self.vistaDatos.layer.cornerRadius = 30;
    self.vistaDatos.layer.masksToBounds = YES;
    
    [UIApplication sharedApplication];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (IBAction)guardarResultados:(UIButton *)sender {
    [IRGSettings sharedSettings].numeroDeMinas = self.numeroDeMinas.text.integerValue;
    [IRGSettings sharedSettings].tiempoDeAyuda = self.tiempoDeAyuda.text.integerValue;
    if (self.activarAyuda.selectedSegmentIndex == 0){
    [IRGSettings sharedSettings].activarAyuda  = true ;
    }
    else {
        [IRGSettings sharedSettings].activarAyuda  = false ;
    }
    [[IRGSettings sharedSettings] guardarSettings];
    [self.view removeFromSuperview];
}

@end
