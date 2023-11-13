//
//  interBankViewController.swift
//  homework7
//
//  Created by Dariya on 14/11/23.
//

import UIKit

class InterBankViewController: UIViewController, Validator {
    
    private let interBankTF = MakerView.shared.makeTF(placeholder: " Enter card number",
                                                      cornerRadius: 12,
                                                      keyboardType: .numberPad)
    
    private let sendBtn = MakerView.shared.makeButton(setTitle: "Send",
                                                      setTitleColor: .white,
                                                      backgroundColor: .gray,
                                                      cornerRadius: 12,
                                                      fontSize: 20,
                                                      fontWeight: .bold
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        initUI()
    }
    
    private func initUI() {
        view.addSubview(interBankTF)
        setupConstraintsForInterBankTF()
        
        view.addSubview(sendBtn)
        setupConstraintsForSendBtn()
    }
    private func setupConstraintsForInterBankTF() {
        NSLayoutConstraint.activate([
            interBankTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            interBankTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 330),
            interBankTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            interBankTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            interBankTF.heightAnchor.constraint(equalToConstant: 45)
        ])
        interBankTF.addTarget(self, action: #selector(validateTF), for: .editingChanged)
    }
    
    @objc func validateTF(_ sender: Any) {
        if let textCount = interBankTF.text?.count, textCount == 12 {
            sendBtn.backgroundColor = .systemOrange
        } else {
            sendBtn.backgroundColor = .gray
        }
    }
    
    private func setupConstraintsForSendBtn() {
        NSLayoutConstraint.activate([
            sendBtn.topAnchor.constraint(equalTo: interBankTF.topAnchor, constant: 100),
            sendBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            sendBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            sendBtn.heightAnchor.constraint(equalToConstant: 45)
        ])
        sendBtn.addTarget(self, action: #selector(sendBtnTapped), for: .touchUpInside)
    }
    
    @objc func sendBtnTapped(_ sender: UIButton) {
        validate(number: interBankTF.text ?? "")
    }
}
