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


@end

@implementation IRGNUmeroSieteSegmentosViewController

-(void)loadView{
    CGRect frame = CGRectMake(100, 100, 200, 200);
    
    IRGSieteSegmentos * vista = [[IRGSieteSegmentos alloc]initWithFrame:frame
                                                               delegado:self];
    self.view = vista;
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

#pragma mark Accesors

-(NSInteger) anchoDelSegmento{
    return 3;
}

-(void) setValor:(NSInteger)valor{
    _valor = valor;
    [self.view setNeedsDisplay];
}

#pragma mark - Delegado
-(void) dibujarNumero:(IRGSieteSegmentos *)sender{
    if (self.valor==2){
        [self dos];
    }
}


#pragma mmark - Auxiliares de primer nivel
-(void) dos{
    [self dibujaSegmentoSuperior];
}

#pragma mark - Auxiliares de segundo nivel

-(void) dibujaSegmentoSuperior{
    CGPoint puntoInicial = CGPointMake(0,0);
    CGPoint puntoFinal = CGPointMake(self.view.frame.size.width,self.anchoDelSegmento);
    [self dibujaSegmentoDesde:puntoInicial hasta:puntoFinal];
    
}

#pragma mark - Auxiliares de tercer nivel
-(void) dibujaSegmentoDesde:(CGPoint)puntoInicial
                      hasta:(CGPoint)puntoFinal{
    CGRect  linea = CGRectMake(puntoInicial.x,puntoInicial.y,puntoFinal.x,puntoFinal.y);
    [[UIColor redColor] setStroke];
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:linea];
    [path moveToPoint:puntoInicial];
    path.lineWidth = 3;
    [path stroke];
    
}



@end
