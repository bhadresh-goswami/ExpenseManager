//
//  SignInViewController.swift
//  ExpenseManager
//
//  Created by COE-18 on 09/12/19.
//  Copyright © 2019 COE-18. All rights reserved.
//

import UIKit
import CoreData

class SignInViewController: UIViewController {

    var appDel:AppDelegate?
    var managedContext:NSManagedObjectContext? = nil
    
    
    
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDel = UIApplication.shared.delegate as? AppDelegate
        
        self.managedContext = (self.appDel?.persistentContainer.viewContext)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSignIn(_ sender: UIButton) {
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "ProfileManage")
        
        fetchReq.fetchLimit = 1
        let condition = NSPredicate.init(format: "username=%@ && password=%@", txtUserName.text!,txtPassword.text!)
        fetchReq.predicate = condition
        do{
            let result = try self.managedContext?.fetch(fetchReq)
            let data = result as! [NSManagedObject]
            print(data[0].value(forKey: "emailid")!)
            appDel?.sessionEmailid = data[0].value(forKey: "emailid")! as! String
            
            self.performSegue(withIdentifier: "mainSegue", sender: nil)
        
        }
        catch(let err as NSError)
        {
            print("err:",err.localizedDescription)
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
