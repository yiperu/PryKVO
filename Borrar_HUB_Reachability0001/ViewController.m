//
//  ViewController.m
//  Borrar_HUB_Reachability0001
//
//  Created by Henry AT on 1/5/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize contador;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    INGCar *car = [[INGCar alloc] init];
    car.model = @"Modelo1";
    car.color = @"Rojo";
    INGCarObserver *carObserver = [[INGCarObserver alloc] initWithCar:car];
// Automtico :
//    car.model = @"Modelo2";
//    car.color = @"Verde";
    
// Manual:
    [carObserver willChangeValueForKey:@"model"];
    car.model = @"Modelo2";
    [carObserver didChangeValueForKey:@"model"];
    
    
    
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // - - - - Veremos Conexion de Internet - - - - - - -
    // Construimos nuestra clase Reachability indicando la URL sobre la
    // que queremos verifica la conectividad (normalmente Google)
    Reachability* reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    
    //reach.reachableOnWWAN = NO;
    
    // Configuramos los dos bloques de código para los cambios de estado
    // de la conectividad
    reach.reachableBlock = ^(Reachability*reach)
    {
        NSLog(@"El dispositivo cuenta con conexión a internet!");
    };
    
    reach.unreachableBlock = ^(Reachability*reach)
    {
        NSLog(@"No hay conexión a internet en estos momentos!");
    };
    
    // Le decimos a nuestra clase Reachability que comience a detectar cambios
    // en la conectividad
    [reach startNotifier];
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    
    
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    
    // Especificamos el nombre de la notificación que queremos observar y opcionalmente podemos
    // indicar el objeto que deseamos contemplar.
    // Si especificamos 'nil' como parámetro de objeto, recibiremos notificaciones de todos los elementos que envia
    // dicha notificación.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveButtonHomeNotification:) name:@"ButtonHomeNotification" object:nil];
    
    
}

-(void)receiveButtonHomeNotification:(NSNotification*) notification
{
    contador++;
    NSLog(@"Valor de contador es: %i", contador);
}



-(void)dealloc{
    // Eliminarnos como observador
    [[NSNotificationCenter defaultCenter] removeObserver:self];	    
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
