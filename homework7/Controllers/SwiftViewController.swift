//
//  SwiftViewController.swift
//  homework7
//
//  Created by Dariya on 13/11/23.
//

import UIKit

class SwiftViewController: UIViewController, Validator {
    
    private let swiftTF = MakerView.shared.makeTF(placeholder: " Enter card number",
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
        view.backgroundColor = .purple
        initUI()
    }
    
    private func initUI() {
        view.addSubview(swiftTF)
        setupConstraintsForSwiftTF()
        
        view.addSubview(sendBtn)
        setupConstraintsForSendBtn()
    }
    
    private func setupConstraintsForSwiftTF() {
        NSLayoutConstraint.activate([
            swiftTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swiftTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 330),
            swiftTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            swiftTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            swiftTF.heightAnchor.constraint(equalToConstant: 45)
        ])
        swiftTF.addTarget(self, action: #selector(validateTF), for: .editingChanged)
    }
    @objc func validateTF(_ sender: Any) {
        if let textCount = swiftTF.text?.count, textCount == 12 {
            sendBtn.backgroundColor = .systemPink
        } else {
            sendBtn.backgroundColor = .gray
        }
    }
    
    private func setupConstraintsForSendBtn() {
        NSLayoutConstraint.activate([
            sendBtn.topAnchor.constraint(equalTo: swiftTF.topAnchor, constant: 100),
            sendBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            sendBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            sendBtn.heightAnchor.constraint(equalToConstant: 45)
        ])
        sendBtn.addTarget(self, action: #selector(sendBtnTapped), for: .touchUpInside)
    }
    
    @objc func sendBtnTapped(_ sender: UIButton) {
        validate(number: swiftTF.text ?? "")
    }
}
