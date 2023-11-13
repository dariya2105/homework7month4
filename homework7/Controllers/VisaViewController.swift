//
//  VisaViewController.swift
//  homework7
//
//  Created by Dariya on 13/11/23.
//

import UIKit

class VisaViewController: UIViewController, Validator {
    
    private let visaTF = MakerView.shared.makeTF(placeholder: " Enter card number",
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
        view.backgroundColor = .systemYellow
        initUI()
    }
    
    private func initUI() {
        view.addSubview(visaTF)
        setupConstraintsForViewTF()
        
        view.addSubview(sendBtn)
        setupConstraintsForSendBtn()
    }
    private func setupConstraintsForViewTF() {
        NSLayoutConstraint.activate([
            visaTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            visaTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 330),
            visaTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            visaTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            visaTF.heightAnchor.constraint(equalToConstant: 45)
        ])
        visaTF.addTarget(self, action: #selector(validateTF), for: .editingChanged)
    }
    
    @objc func validateTF(_ sender: Any) {
        if let textCount = visaTF.text?.count, textCount == 12 {
            sendBtn.backgroundColor = .systemGreen
        } else {
            sendBtn.backgroundColor = .gray
        }
    }
    
    private func setupConstraintsForSendBtn() {
        NSLayoutConstraint.activate([
            sendBtn.topAnchor.constraint(equalTo: visaTF.topAnchor, constant: 100),
            sendBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            sendBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            sendBtn.heightAnchor.constraint(equalToConstant: 45)
        ])
        sendBtn.addTarget(self, action: #selector(sendBtnTapped), for: .touchUpInside)
    }
    
    @objc func sendBtnTapped(_ sender: UIButton) {
        validate(number: visaTF.text ?? "")
    }
}
