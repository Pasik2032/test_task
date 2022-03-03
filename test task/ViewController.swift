//
//  ViewController.swift
//  test task
//
//  Created by Даниил Пасилецкий on 02.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupViews()
        setupLayout()
    }
    
    let colorButton = CGColor(red: 70, green: 167, blue: 246, alpha: 1)
    let UIColorButton = UIColor(red: 70, green: 167, blue: 246, alpha: 1)
    
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    var titleLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Персональные данные"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    lazy var stackChild: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Дети (макс. 5)"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        stackView.addArrangedSubview(label)
        let buttonAddChildren = UIButton()
        buttonAddChildren.translatesAutoresizingMaskIntoConstraints = false
        buttonAddChildren.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        buttonAddChildren.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonAddChildren.widthAnchor.constraint(equalToConstant: 200).isActive = true
        buttonAddChildren.setImage(UIImage(systemName: "plus"), for: .normal)
        buttonAddChildren.setTitle("Добавить ребенка", for: .normal)
        buttonAddChildren.setTitleColor(.systemBlue, for: .normal)
        buttonAddChildren.layer.cornerRadius = 15
        buttonAddChildren.layer.borderWidth = 2
        buttonAddChildren.layer.borderColor = UIColor.systemBlue.cgColor
        stackView.addArrangedSubview(buttonAddChildren)
        return stackView
    }()
    
    

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(inputName)
        stackView.addArrangedSubview(inputAge)
        stackView.addArrangedSubview(stackChild)
        
    }
    
    private func setupLayout() {
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        // because: "Constraints between the height, width, or centers attach to the scroll view’s frame." -
        // https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithScrollViews.html
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    
}

