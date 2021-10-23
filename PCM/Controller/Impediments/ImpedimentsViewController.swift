//
//  ImpedimentsViewController.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 23/10/21.

import Foundation
import UIKit

internal class ImpedimentsViewController: UIViewController {
    
    private var categoriaTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Categoria"
        label.textColor = .blackProt
        return label
    }()
    
    private lazy var constraints: [NSLayoutConstraint] = {
        [
            categoriaTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.135),
            categoriaTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        ]
    }()
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .detailsBg
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationItem.title = "Impedimentos"
        
        view.addSubview(categoriaTitle)
    }
    
    internal override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate(constraints)
    }
    
}
