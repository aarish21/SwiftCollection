//
//  RegisterVC.swift
//  Swift Collection
//
//  Created by Aarish on 10/08/22.
//

import Foundation
import UIKit
import Firebase
class RegisterVC: UIViewController {
    
    @IBOutlet weak var createBtn: UIButton!
    
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var appleBtn: UIButton!
    @IBOutlet weak var fbBtn: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       setupUI()
    }
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTF.text, let password = passwordTF.text{
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    print("User created with email: \(email)")
                }
            }
        }
    }
    
    func setupUI(){
        createBtn.layer.cornerRadius = 8
        emailTF.layer.cornerRadius = 8
        passwordTF.layer.cornerRadius = 8
        emailTF.backgroundColor = .white
        emailTF.setLeftPaddingPoints(10)
        passwordTF.backgroundColor = .white
        passwordTF.setLeftPaddingPoints(10)
        googleBtn.layer.cornerRadius = 8
        appleBtn.layer.cornerRadius = 8
        fbBtn.layer.cornerRadius = 8
    }

}



extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}