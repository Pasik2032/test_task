//
//  PersonalPresenter.swift
//  test task
//
//  Created by Даниил Пасилецкий on 03.03.2022.
//

import Foundation

protocol PersonalPresenterProtocol: class {
    func configureView()
    func addChildren()
    func ClearDisActive()
    func NoNewChild()
    func yesNewChild()
    func ClearActive()
    func addNewChildren()
    func deleteChild(_ view: ChildView)
}

class PersonalPresenter: PersonalPresenterProtocol {
    func yesNewChild() {
        view.enabledNewChildren()
    }
    
    var children: [ChildView] = []
    func NoNewChild() {
        view.DisabelNewChildren()
    }
    
    func addChildren() {
        interactor.addChildren()
    }
    
    func deleteChild(_ view: ChildView) {
        self.view.deletChild(view)
        interactor.delChild()
    }
    
    func configureView() {
        view.setupViews()
        view.setupLayout()
    }
    
    func ClearActive(){
        view.clearActive()
    }
    
    func ClearDisActive(){
        view.clearDisActive()
    }
    
    func addNewChildren() {
        let child = ChildView()
        child.presenter = self
        children.append(child)
        view.addNewChild(child)
    }
    
    weak var view: PersonalViewProtocol!
    var interactor: PersonalIteractorProtocol!
    
    required init(view: PersonalViewProtocol) {
        self.view = view
    }
    

    
}

