//
//  BP2S_availableOptionsViewController.m
//  MyCartography
//
//  Created by Rui Cardoso on 29/04/14.
//  Copyright (c) 2014 BNP Paribas Securities Services. All rights reserved.
//

#import "BP2S_availableOptionsViewController.h"

@interface BP2S_availableOptionsViewController ()<NSFetchedResultsControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSString *selectedTable;

@end

@implementation BP2S_availableOptionsViewController
BOOL availableOptionsAtTopLevel;

#pragma mark Collection Datasource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
   
    return 1;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   
    if (availableOptionsAtTopLevel) {
        return 6;
    }
    else{
        id <NSFetchedResultsSectionInfo> sectionInfo = [[_fetchedResultsController sections] objectAtIndex:section];
        
        NSInteger count = [sectionInfo numberOfObjects];
        
        return count;
    }
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if (availableOptionsAtTopLevel) {
        if (indexPath.row == 0) {
            
        }
        else if (indexPath.row == 1){
        
        }
        else if (indexPath.row == 2){
            
        }
        else if (indexPath.row == 3){
            
        }
        else if (indexPath.row == 4){
            
        }
        else if (indexPath.row == 5){
            
        }
    }
    else{
    
    }
    
    return cell;
}

#pragma mark Collection Delegate


#pragma mark FetchResultsController
-(NSFetchedResultsController *)fetchedResultsController{
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    else{
        NSFetchRequest *fetchRequest    = [[NSFetchRequest alloc] init];
        
        
        //se location
            // se nivel 1 - agrupar por regiao
            // se nivel 2 - agrupar por pais
            // se nivel 3 nao é necessario agrupar
        
        //Por cada registo na tabela de locations, é possivel obter todos os recursos desta location fazendo
        //NSSet *resources = (registo da location).resources
        //Para saber quantos sao. [resources count];
        //É preciso muda o fetchRequest dependendo da categoria seleccionada no inicio e do nivel em que estamos actualmente.
        //Se estivermos no topo listar os nomes das tabelas;
        //No 2º nivel, os campos da tabela escolhida
        //No 3º nivel usar o fetchRequest agrupando os registos de acordo com o campo seleccionado
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Locations" inManagedObjectContext:_managedObjectContext];
        
        [fetchRequest setEntity:entity];
        
        [fetchRequest setPropertiesToGroupBy:[NSArray arrayWithObject:@"region"]];
        
        _fetchedResultsController               = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:_managedObjectContext sectionNameKeyPath:nil cacheName:nil];
        
        _fetchedResultsController.delegate = self;
        
        return _fetchedResultsController;
    }
}


#pragma mark View LifeCycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView{
    availableOptionsAtTopLevel = YES;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
