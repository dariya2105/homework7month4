//
//  ViewController.swift
//  homework7
//
//  Created by Dariya on 13/11/23.
//

import UIKit

class MenuController: UIViewController {
    
    private let visaBtn = MakerView.shared.makeButton(setTitle: "VisaToVisaTransfer",
                                                      setTitleColor: .systemYellow,
                                                      backgroundColor: .white,
                                                      cornerRadius: 16,
                                                      fontSize: 20,
                                                      fontWeight: .bold)
    
    private let elcardBtn = MakerView.shared.makeButton(setTitle: "ElcardToElcardTransfer",
                                                        setTitleColor: .systemBlue,
                                                        backgroundColor: .white,
                                                        cornerRadius: 16,
                                                        fontSize: 20,
                                                        fontWeight: .bold)
    
    private let swiftBtn = MakerView.shared.makeButton(setTitle: "SwiftTransfer",
                                                       setTitleColor: .purple,
                                                       backgroundColor: .white,
                                                       cornerRadius: 16,
                                                       fontSize: 20,
                                                       fontWeight: .bold)
    
    private let interBankBtn = MakerView.shared.makeButton(setTitle: "interbankTransfer",
                                                           setTitleColor: .systemGreen,
                                                           backgroundColor: .white,
                                                           cornerRadius: 16,
                                                           fontSize: 20,
                                                           fontWeight: .bold)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        initUI()
    }
    
    private func initUI() {
        view.addSubview(visaBtn)
        setupConstraintsForVisaBtn()
        
        view.addSubview(elcardBtn)
        setupconstraintsForElcardBtn()
        
        view.addSubview(swiftBtn)
        setupconstraintsForSwiftBtn()
        
        view.addSubview(interBankBtn)
        setupConstraintsForInterBankBtn()
    }
    
    private func setupConstraintsForVisaBtn() {
        NSLayoutConstraint.activate([
            visaBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            visaBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            visaBtn.widthAnchor.constraint(equalToConstant: 250),
            visaBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
        visaBtn.addTarget(self, action: #selector(visaBtntapped), for: .touchUpInside)
    }
    
    @objc func visaBtntapped(_ sender: UIButton) {
        let vc  = VisaViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupconstraintsForElcardBtn() {
        NSLayoutConstraint.activate([
            elcardBtn.topAnchor.constraint(equalTo: visaBtn.bottomAnchor, constant: 35),
            elcardBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            elcardBtn.widthAnchor.constraint(equalToConstant: 250),
            elcardBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
        elcardBtn.addTarget(self, action: #selector(elcardBtnTapped), for: .touchUpInside)
    }
    
    @objc func elcardBtnTapped(_ sender: UIButton) {
        let vc = ElcardViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupconstraintsForSwiftBtn() {
        NSLayoutConstraint.activate([
            swiftBtn.topAnchor.constraint(equalTo: elcardBtn.bottomAnchor, constant: 35),
            swiftBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swiftBtn.widthAnchor.constraint(equalToConstant: 250),
            swiftBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
        swiftBtn.addTarget(self, action: #selector(swiftBtnTapped), for: .touchUpInside)
    }
    @objc func swiftBtnTapped(_ sender: UIButton) {
        let vc = SwiftViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupConstraintsForInterBankBtn() {
        NSLayoutConstraint.activate([
            interBankBtn.topAnchor.constraint(equalTo: swiftBtn.bottomAnchor, constant: 35),
            interBankBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            interBankBtn.widthAnchor.constraint(equalToConstant: 250),
            interBankBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
        interBankBtn.addTarget(self, action: #selector(interBankTapped), for: .touchUpInside)
    }
    
    @objc func interBankTapped() {
        let vc = InterBankViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
