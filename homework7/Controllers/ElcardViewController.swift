//
//  ElcardViewController.swift
//  homework7
//
//  Created by Dariya on 13/11/23.
//

import UIKit

class ElcardViewController: UIViewController, Validator {
    
    private let elcardTF = MakerView.shared.makeTF(placeholder: " Enter card number",
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
        view.backgroundColor = .systemBlue
        initUI()
        
    }
    
    private func initUI() {
        view.addSubview(elcardTF)
        setupConstraintsForElcardTF()
        
        view.addSubview(sendBtn)
        setupConstraintsForSendBtn()
    }
    private func setupConstraintsForElcardTF() {
        NSLayoutConstraint.activate([
            elcardTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            elcardTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 330),
            elcardTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            elcardTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            elcardTF.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        elcardTF.addTarget(self, action: #selector(validateTF), for: .editingChanged)
    }
    
    @objc func validateTF(_ sender: Any) {
        if let textCount = elcardTF.text?.count, textCount == 12 {
            sendBtn.backgroundColor = .systemYellow
        } else {
            sendBtn.backgroundColor = .gray
        }
    }
    
    
    private func setupConstraintsForSendBtn() {
        NSLayoutConstraint.activate([
            sendBtn.topAnchor.constraint(equalTo: elcardTF.topAnchor, constant: 100),
            sendBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            sendBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            sendBtn.heightAnchor.constraint(equalToConstant: 45)
        ])
        sendBtn.addTarget(self, action: #selector(sendBtnTapped), for: .touchUpInside)
    }
    
    @objc func sendBtnTapped(_ sender: UIButton) {
        validate(number: elcardTF.text ?? "")
    }
}
