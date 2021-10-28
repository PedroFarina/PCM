//
//  ImpedimentsViewController.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 23/10/21.

import Foundation
import UIKit

internal class ImpedimentsViewController: UIViewController {

    private var currentCategory: PCMImpeditiveCategory? = EquipmentCategory()

    private let categories: [PCMImpeditiveCategory]
    
    private lazy var exitButton: UIBarButtonItem = {
        var exitButton = UIBarButtonItem()
        exitButton = UIBarButtonItem(title: "Finalizar", style: UIBarButtonItem.Style.plain, target: self, action: #selector(exitTap(_:)))
        exitButton.tintColor = .buttonColor
        return exitButton
    }()
    
    private lazy var cancelButton: UIBarButtonItem = {
        var exitButton = UIBarButtonItem()
        exitButton = UIBarButtonItem(title: "Cancelar", style: UIBarButtonItem.Style.plain, target: self, action: #selector(exitTap(_:)))
        exitButton.tintColor = .buttonColor
        
        return exitButton
    }()
    
    private var categoriaTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Categoria"
        label.textColor = .blackProt
        return label
    }()
    
    private var subCategoriaTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Subcategoria"
        label.textColor = .blackProt
        return label
    }()
    
    private var addTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        label.text = "0h 0m"
        label.textColor = .blackProt
        return label
    }()
    
    private var hour: Int = {
        var hour = Int()
        hour = 0
        return hour
    }()
    
    private var min: Int = {
        var min = Int()
        min = 0
        return min
    }()
    
    private var timeTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Tempo"
        label.textColor = .blackProt
        return label
    }()
    
    private lazy var pickerViewCategoria: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        // MARK: FARINA ME PERDOA
        picker.dataSource = self
        picker.delegate = self
        picker.tag = 1
        return picker
    }()
    
    private lazy var pickerViewSubCategoria: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        // MARK: FARINA ME PERDOA
        picker.dataSource = self
        picker.delegate = self
        picker.tag = 2
        return picker
    }()
    
    private lazy var buttonTime: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(includeTap(_:)), for: .touchUpInside)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .buttonColor
        return button
    }()
    
    private var addTimeView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .bgColor
        containerView.layer.cornerRadius = 7
        return containerView
    }()
    
    private lazy var constraints: [NSLayoutConstraint] = {
        [
            categoriaTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.135),
            categoriaTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            pickerViewCategoria.topAnchor.constraint(equalTo: categoriaTitle.bottomAnchor, constant: 10),
            pickerViewCategoria.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            pickerViewCategoria.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            pickerViewCategoria.heightAnchor.constraint(equalToConstant: 100),
            
            subCategoriaTitle.topAnchor.constraint(equalTo: pickerViewCategoria.bottomAnchor, constant: 20),
            subCategoriaTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            pickerViewSubCategoria.topAnchor.constraint(equalTo: subCategoriaTitle.bottomAnchor, constant: 10),
            pickerViewSubCategoria.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            pickerViewSubCategoria.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            pickerViewSubCategoria.heightAnchor.constraint(equalToConstant: 100),
            
            timeTitle.topAnchor.constraint(equalTo: pickerViewSubCategoria.bottomAnchor, constant: 20),
            timeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            addTimeView.topAnchor.constraint(equalTo: timeTitle.bottomAnchor, constant: 20),
            addTimeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            addTimeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            addTimeView.heightAnchor.constraint(equalToConstant: 44),
            
            addTimeLabel.topAnchor.constraint(equalTo: addTimeView.topAnchor, constant: 12),
            addTimeLabel.centerXAnchor.constraint(equalTo: addTimeView.centerXAnchor, constant: -10),
            
            buttonTime.topAnchor.constraint(equalTo: addTimeView.topAnchor, constant: 12),
            buttonTime.centerXAnchor.constraint(equalTo: addTimeView.centerXAnchor, constant: 30),
        ]
    }()

    init(categories: [PCMImpeditiveCategory]) {
        self.categories = categories

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .detailsBg
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationItem.title = "Impedimentos"
        
        navigationItem.rightBarButtonItem = exitButton
        navigationItem.leftBarButtonItem = cancelButton

        view.addSubview(categoriaTitle)
        view.addSubview(pickerViewCategoria)
        view.addSubview(subCategoriaTitle)
        view.addSubview(pickerViewSubCategoria)
        view.addSubview(timeTitle)
        view.addSubview(addTimeView)
        view.addSubview(addTimeLabel)
        view.addSubview(buttonTime)
    }
    
    internal override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate(constraints)
    }

    @objc func includeTap(_: UIButton){
        hour = hour + 1
        min = min + 30
        if min == 60 {
            min = 0
            hour = hour + 1
        }
        addTimeLabel.text = "\(hour)h \(min)m"
    }
    
    @objc func exitTap(_: UIButton){
        self.dismiss(animated: true)
    }
}

extension ImpedimentsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard pickerView.tag == 2 else {
            return categories.count
        }

        guard let category = currentCategory else {
            return 0
        }

        return category.subcategories.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard pickerView.tag == 2 else {
            return categories[row].description
        }

        guard let category = currentCategory else {
            return ""
        }

        return category.subcategories[row].description
    }
}

extension ImpedimentsViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard pickerView.tag == 1 else {
            return
        }

        currentCategory = ImpeditiveCategories(rawValue: row)?.categoryValue
        pickerViewSubCategoria.reloadAllComponents()
        pickerViewSubCategoria.selectRow(0, inComponent: 0, animated: true)
    }
}

