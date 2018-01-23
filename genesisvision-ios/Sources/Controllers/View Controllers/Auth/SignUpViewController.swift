//
//  SignUpViewController.swift
//  genesisvision-ios
//
//  Created by George Shaginyan on 18.01.18.
//  Copyright © 2018 Genesis Vision. All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController, ValidableFields {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    @IBOutlet var signUpButton: UIButton!
    
    //Fields for validate
    var validateFields: [Validation.ValidateField] {
        return [Validation.ValidateField(text: emailTextField.text ?? "", type: .email),
                Validation.ValidateField(text: passwordTextField.text ?? "", type: .password),
                Validation.ValidateField(text: confirmPasswordTextField.text ?? "", type: .confirmPassword)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SignUp"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        #if DEBUG
            emailTextField.text = "qqq@qqq.com"
            passwordTextField.text = "qwerty"
            confirmPasswordTextField.text = "qwerty"
        #endif
    }

    // MARK: - Private methods
    
    private func sighUpMethod() {
        //Hide keyboard
        view.endEditing(true)
        
        //If fields are valid then signUp
        guard isValid(with: validateFields) else {
            return
        }
        
        showProgressHUD()
        
        //SighUp with fields
        AuthController.signUp(email: emailTextField.text ?? "", password: passwordTextField.text ?? "", confirmPassword: confirmPasswordTextField.text ?? "") { [weak self] (result) in
            self?.hideHUD()
            
            switch result {
            case .success:
                self?.showSuccessHUD(completion: { (finish) in
                    self?.showConfirmationVC()
                })
            case .failure(let reason):
                if reason != nil {
                    self?.showErrorHUD(subtitle: reason)
                }
            }
        }
    }
    
    private func showConfirmationVC() {
        //TODO: Move to Router
        guard let viewController = ConfirmationViewController.storyboardInstance(name: .auth) else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        sighUpMethod()
    }

}
