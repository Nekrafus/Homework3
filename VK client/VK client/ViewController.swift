//
//  ViewController.swift
//  VK client
//
//  Created by Vladimir Pulkhrov on 03.07.2020.
//  Copyright © 2020 Vladimir Pulkhrov. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var avatarView: AvatarView!

    
    @IBAction func animate(_ sender: Any)
    {
         UIView.animate(withDuration: 2.8,
                              delay: 1.0,
                              options: [.repeat],
                              animations:
                                   {
                                           self.dot1.alpha = 0
                                   })
        UIView.animate(withDuration: 2.8,
                       delay: 3.0,
                       options: [.repeat],
                       animations:
                            {
                                    self.dot2.alpha = 0
                            })
                            
            
         UIView.animate(withDuration: 2.8,
                              delay: 2.0,
                              options: [.repeat],
                              animations:
                                   {
                                           self.dot3.alpha = 0
                                   })
    }
    
    
    var dot1: UIView = UIView()
    var dot2: UIView = UIView()
    var dot3: UIView = UIView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarView.configure()
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
               scrollView.addGestureRecognizer(tapGesture)

    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addDot1()
        addDot2()
        addDot3()
    }
    
    func addDot1()
        
    {
        dot1.frame = CGRect(x: (view.frame.width - 50) / 2, y: view.frame.height - 350, width: 10, height: 10)
        
        dot1.backgroundColor = .blue
        dot1.layer.cornerRadius = dot1.bounds.width / 2
        
        view.addSubview(dot1)
    }
    
    func addDot2()
        
    {
        dot2.frame = CGRect(x: (view.frame.width) / 2, y: view.frame.height - 350, width: 10, height: 10)
        
        dot2.backgroundColor = .blue
        dot2.layer.cornerRadius = dot2.bounds.width / 2
        
        view.addSubview(dot2)
    }
    
    func addDot3()
        
    {
        dot3.frame = CGRect(x: (view.frame.width - 25) / 2, y: view.frame.height - 350, width: 10, height: 10)
        
        dot3.backgroundColor = .blue
        dot3.layer.cornerRadius = dot1.bounds.width / 2
        
        view.addSubview(dot3)
    }
    
    
    
    
    
    
    @objc func keyboardWillShown(notification: Notification)
    {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
                      
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0)
                      
        scrollView.contentInset = contentInsets
        
        scrollView.scrollIndicatorInsets = contentInsets

    }
    
    @objc func keyboardWillHide(notification: Notification)
    {
       scrollView.contentInset = UIEdgeInsets.zero
       scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    @objc func hideKeyboard()
    {
           scrollView.endEditing(true)
    }
    
    
    
    private func checkLoginInfo() -> Bool {
        guard let loginText = loginField.text else { return false }
        guard let pwdText = passwordField.text else { return false }
        
        if loginText == "admin", pwdText == "12345" {
            print("Успешно!")
            return true
        }
        else {
            print("Не очень успешно")
            return false
        }
    }
    
    
    
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "loginSegue" {
            if checkLoginInfo() {
                return true
            }
            else {
                showLoginError()
                return false
            }
        }
        
        return true
    }
    
    private func showLoginError() {
        let alert = UIAlertController(title: "Ошибка!", message: "Логин и/или пароль не верны", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
        
        
        
    
    
    
    
    
    
    
    
    @IBAction func login(_ sender: UIStoryboardSegue)
       {
           print (sender)
        }


}

