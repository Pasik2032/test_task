//
//  ChildView.swift
//  test task
//
//  Created by Даниил Пасилецкий on 03.03.2022.
//

import UIKit

class ChildView: UIStackView {
    
    let inputName: InputField = {
        let control = InputField()
        control._placeholder = "Имя"
        return control
    }()
    
    let inputAge: InputField = {
        let control = InputField()
        control._placeholder = "Возраст"
        control.keyboardType = .numberPad
        return control
    }()
    
    
    lazy var stackField: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let buttonDelete: UIButton = {
        let buttonAddChildren = UIButton()
        buttonAddChildren.translatesAutoresizingMaskIntoConstraints = false
        buttonAddChildren.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        buttonAddChildren.addTarget(self, action: #selector(deleters), for: .touchDown)
        buttonAddChildren.setTitle("Удалить", for: .normal)
        
        buttonAddChildren.setTitleColor(.systemBlue, for: .normal)
        return buttonAddChildren
    }()
    
    var presenter: PersonalPresenter?
    
    @objc func deleters(){
        print("aaaa")
        presenter?.deleteChild(self)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .horizontal
        alignment = .leading
        translatesAutoresizingMaskIntoConstraints = false
        stackField.addArrangedSubview(inputName)
        stackField.addArrangedSubview(inputAge)
        addArrangedSubview(stackField)
        addArrangedSubview(buttonDelete)
        buttonDelete.rightAnchor.constraint(equalTo: rightAnchor, constant: frame.width/2).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
