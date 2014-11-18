//
//  IRGVistaPorcentajeDeAvanceViewController.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 18/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGVistaPorcentajeDeAvanceViewController.h"
#import "IRGVistaConPorcentajeDeAvance.h"



@interface IRGVistaPorcentajeDeAvanceViewController ()
@property (nonatomic) CGRect frame;
@property (nonatomic) IRGVistaConPorcentajeDeAvance *vistaConPorcentajeDeAvance;
@property (nonatomic) UILabel* etiquetaConPorcentajeDeAvance;

@end

@implementation IRGVistaPorcentajeDeAvanceViewController

#pragma mark - Inicialiador
-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    return [self initConFrame:CGRectMake(0, 0, 100, 100)];
    
}

-(instancetype) initConFrame:(CGRect) frame{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _frame = frame;
    }
    return  self;
}

-(void) loadView{
    IRGVistaConPorcentajeDeAvance *vistaConPorcentajeDeAvance = [[IRGVistaConPorcentajeDeAvance alloc]initWithFrame:(self.frame)];
    CGRect a = self.frame;
    CGRect frameDeLaEtiqueta =  CGRectMake(15, 20, 30, 15);
    self.etiquetaConPorcentajeDeAvance = [[UILabel alloc]initWithFrame:frameDeLaEtiqueta];
    self.etiquetaConPorcentajeDeAvance.adjustsFontSizeToFitWidth = true;
    [vistaConPorcentajeDeAvance addSubview:self.etiquetaConPorcentajeDeAvance];
    self.etiquetaConPorcentajeDeAvance.text = @"0%";
    
    self.view = vistaConPorcentajeDeAvance;
    self.vistaConPorcentajeDeAvance = vistaConPorcentajeDeAvance;
    self.vistaConPorcentajeDeAvance.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

#pragma mark - Auxiliares de primer nivel

-(void) dibujarAvance:(float)porcentajeDeAvance{
    self.vistaConPorcentajeDeAvance.porcentajeDeAvance = porcentajeDeAvance;
    NSInteger valorEnteroDePorcentajeDeAvance = porcentajeDeAvance*100;
    self.etiquetaConPorcentajeDeAvance.text = [NSString stringWithFormat:@"%d%%",valorEnteroDePorcentajeDeAvance];
    [self.vistaConPorcentajeDeAvance setNeedsDisplay];
}
@end



