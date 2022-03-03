//
//  ViewController.swift
//  test task
//
//  Created by Даниил Пасилецкий on 02.03.2022.
//

import UIKit

protocol PersonalViewProtocol: class {
    func setupViews()
    func setupLayout()
    func DisabelNewChildren()
    func addNewChild(_ child: ChildView)
    func deletChild(_ child: ChildView)
    func enabledNewChildren()
    func clearActive()
    func clearDisActive()
}

class ViewController: UIViewController {
    
    var presenter: PersonalPresenterProtocol!
    let configurator: PersonalConfiguratorProtocol = PersonalConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurator.configure(with: self)
        presenter.configureView()
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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Персональные данные"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
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
    
    let buttonAddChildren: UIButton = {
        let buttonAddChildren = UIButton()
        buttonAddChildren.translatesAutoresizingMaskIntoConstraints = false
        buttonAddChildren.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        buttonAddChildren.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonAddChildren.widthAnchor.constraint(equalToConstant: 200).isActive = true
        buttonAddChildren.setImage(UIImage(systemName: "plus"), for: .normal)
        buttonAddChildren.setTitle("Добавить ребенка", for: .normal)
        buttonAddChildren.setTitleColor(.systemBlue, for: .normal)
        buttonAddChildren.addTarget(self, action: #selector(addChildren), for: .touchDown)
        buttonAddChildren.layer.cornerRadius = 15
        buttonAddChildren.layer.borderWidth = 2
        buttonAddChildren.layer.borderColor = UIColor.systemBlue.cgColor
        return buttonAddChildren
    }()
    
    let buttonClearChildren: UIButton = {
        let buttonAddChildren = UIButton()
        buttonAddChildren.translatesAutoresizingMaskIntoConstraints = false
        buttonAddChildren.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        buttonAddChildren.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonAddChildren.widthAnchor.constraint(equalToConstant: 200).isActive = true
        buttonAddChildren.setTitle("Очистить", for: .normal)
        buttonAddChildren.addTarget(self, action: #selector(ClearChildren), for: .touchDown)
        buttonAddChildren.setTitleColor(.systemRed, for: .normal)
        buttonAddChildren.layer.cornerRadius = 15
        buttonAddChildren.layer.borderWidth = 2
        buttonAddChildren.layer.borderColor = UIColor.systemRed.cgColor
        return buttonAddChildren
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
        stackView.addArrangedSubview(buttonAddChildren)
        return stackView
    }()
    
    
    @objc func addChildren(){
        presenter.addChildren()
    }
    
    @objc func ClearChildren(){
        let alert = UIAlertController(title: "Предупреждение", message: "Вы уверенны что хотите удолить все?", preferredStyle: .actionSheet)
            
        alert.addAction(UIAlertAction(title: "Сбросить данные", style: .destructive , handler:{ (UIAlertAction) in
            self.presenter.ClearChildren()
            self.inputName.text = ""
            self.inputAge.text = ""
            }))
            
            alert.addAction(UIAlertAction(title: "Отмена", style: .cancel , handler:{ (UIAlertAction)in
                print("Отмена")
            }))

        

            self.present(alert, animated: true)
    }
}

extension ViewController: PersonalViewProtocol {
    func clearActive() {
        stackView.addArrangedSubview(buttonClearChildren)
    }
    
    func clearDisActive() {
        stackView.removeArrangedSubview(buttonClearChildren)
        buttonClearChildren.removeFromSuperview()
    }
    
    
    func deletChild(_ child: ChildView) {
        stackView.removeArrangedSubview(child)
        child.removeFromSuperview()
    }
    
    func addNewChild(_ child: ChildView) {
        stackView.addArrangedSubview(child)
    }
    
    func DisabelNewChildren() {
        buttonAddChildren.isEnabled = false
    }
    
    func enabledNewChildren(){
        buttonAddChildren.isEnabled = true
    }
    
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(inputName)
        stackView.addArrangedSubview(inputAge)
        stackView.addArrangedSubview(stackChild)
    }
    
    func setupLayout() {
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
}

