//
//  ViewController.swift
//  CoraData
//
//  Created by Amira on 11/14/20.
//  Copyright © 2020 Amira. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
//MARK:-OutLets
    
    @IBOutlet weak var NameTf: UITextField!
    
    @IBOutlet weak var PriceTf: UITextField!
    
    @IBOutlet weak var countTf: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PriceTf.keyboardType = .numberPad
        countTf.keyboardType = .numberPad
    }

//MARK:-IBAction
    @IBAction func selectbtn(_ sender: UIButton) {
        let fetch:NSFetchRequest = Products.fetchRequest()
        do{
 let results =  try context.fetch(fetch)
            for result in results {
                
                print(result.pID,result.pName,result.pCount,result.pPrice)
                
            }
        }catch{
            print(error.localizedDescription)
            
        }
       
        
        
    }
    
    @IBAction func insertbtn(_ sender: UIButton) {
        
        if NameTf.text != " " &&  PriceTf.text != " " && countTf.text != " "{
             let object = NSEntityDescription.insertNewObject(forEntityName: "Products", into: context)
                   as! Products
            object.pID = UUID()
            object.pName = NameTf.text!
            object.pPrice = Double(PriceTf.text!)!
            object.pCount = Int16(countTf.text!)!
            context.insert(object)
            do{
          try             context.save()
                
                  NameTf.text = " "
                     PriceTf.text = " "
                countTf.text = " "
                print("data inserted")
            }catch{
                print(error.localizedDescription)
            }
            
            
        }
        
        
       
        
        
        
    }
    
    @IBAction func updatebtn(_ sender: UIButton) {
          let fetch:NSFetchRequest = Products.fetchRequest()
        
        let predict = NSPredicate(format: "pName = 'car'")
        fetch.predicate = predict
        do{
              let results =  try context.fetch(fetch)
                         for result in results {
                             
                            result.pName = " amira"
                             
                         }
                      
                      
                      try context.save()
                      print("all data deleted")
                     }catch{
                         print(error.localizedDescription)
                         
                     }
        
    }
    
    @IBAction func deletebtn(_ sender: UIButton) {
          let fetch:NSFetchRequest = Products.fetchRequest()
         let predict = NSPredicate(format: "pName= 'iphone'" )
        fetch.predicate = predict
        do{
              let results =  try context.fetch(fetch)
                         for result in results {
                             
                          context.delete(result)
                             
                         }
                      
                      
                      try context.save()
                      print(" data deleted")
                     }catch{
                         print(error.localizedDescription)
                         
                     }
        
        
    }
    

    @IBAction func deleteAll(_ sender: UIButton) {
        
         let fetch:NSFetchRequest = Products.fetchRequest()
        let predict = NSPredicate(format: "pName= 'car'" )
        fetch.predicate = predict
               do{
        let results =  try context.fetch(fetch)
                   for result in results {
                       
                    context.delete(result)
                       
                   }
                
                
                try context.save()
                print("  All data deleted")
               }catch{
                   print(error.localizedDescription)
                   
               }
              
               
        
        
        
        
    }
    
    
    //MARK:-Helper Functions
    
    
    
}

