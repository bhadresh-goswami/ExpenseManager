//
//  ViewController.swift
//  ExpenseManager
//
//  Created by COE-18 on 09/12/19.
//  Copyright © 2019 COE-18. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var appDel:AppDelegate?
    var managedContext:NSManagedObjectContext? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDel = UIApplication.shared.delegate as? AppDelegate
        
        self.managedContext = (self.appDel?.persistentContainer.viewContext)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var txtUName: UITextField!
    
    var UserId = 0
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmailId: UITextField!
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        
        let profileDescription = NSEntityDescription.entity(forEntityName: "ProfileManage", in: self.managedContext!)
        
        let profile = NSManagedObject.init(entity: profileDescription!, insertInto: self.managedContext!)
        profile.setValue(txtUName.text!, forKey: "username")
        profile.setValue(txtPassword.text!, forKey: "password")
        profile.setValue(txtEmailId.text!, forKey: "emailid")
        profile.setValue(txtUName.text!, forKey: "image")
        profile.setValue(UserId, forKey: "profileid")
        
        do{
            try self.managedContext?.save()
        }
        catch{
            print("Error in save!")
        }
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

