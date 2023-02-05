//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by pc on 5.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var birthdayTextField: UITextField!
   
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storedName=UserDefaults.standard.object(forKey: "name")
        let storedBirthday=UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String{
            nameLabel.text="NAME: \(newName)"
            
        
        }
        if let newBirthday = storedBirthday as? String{
            birthdayLabel.text="BIRTHDAY: \(newBirthday)"
        }
    }

    @IBAction func saveButton(_ sender: Any) {
        
        //Basit verileri örn. bir iki string veya benzeri olanları ufak çaplı bir database e aktarman için aşağıdaki gibi UserDefaults sınıfını kullanıyoruz. Bizden ilk girdi olarak veriyi, ikinci girdi olarak ise ona vereceğimiz hatırlayabileceğimiz bir isim istiyor.
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text, forKey: "birthday")
        nameLabel.text="NAME: " + nameTextField.text!
        birthdayLabel.text="BIRTHDAY: " + birthdayTextField.text!
        
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "NAME:"
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "BIRTHDAY:"
        }
        
    }
    
}

