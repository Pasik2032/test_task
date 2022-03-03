//
//  PersonalConfigurator.swift
//  test task
//
//  Created by Даниил Пасилецкий on 03.03.2022.
//

import Foundation

protocol PersonalConfiguratorProtocol: class {
    func configure(with viewController: ViewController)
}

class PersonalConfigurator : PersonalConfiguratorProtocol {
    func configure(with viewController: ViewController) {
        let presenter = PersonalPresenter(view: viewController)
        let interactor = PersonalIteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
    
    
}
