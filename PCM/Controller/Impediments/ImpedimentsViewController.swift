//
//  ImpedimentsViewController.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 23/10/21.

import Foundation
import UIKit

internal class ImpedimentsViewController: UIViewController {

    private lazy var currentCategory: PCMImpeditiveCategory? = categories.first
    private lazy var currentSubcategoryValue: String = currentCategory?.subcategories.first ?? ""
    private let categories: [PCMImpeditiveCategory] = [WorkerCategory(), EquipmentCategory(), MaterialCategory(), NatureCategory()]

    private let didAddImpeditive: (PCMImpeditive) -> Void
    
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
        picker.dataSource = self
        picker.delegate = self
        picker.tag = 1
        return picker
    }()
    
    private lazy var pickerViewSubCategoria: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        picker.tag = 2
        return picker
    }()

    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .countDownTimer
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.addTarget(self, action: #selector(pickerHandler), for: .valueChanged)

        return picker
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
            
            datePicker.topAnchor.constraint(equalTo: timeTitle.bottomAnchor, constant: 20),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            datePicker.heightAnchor.constraint(equalToConstant: 100)
        ]
    }()

    init(didAddImpeditive: @escaping (PCMImpeditive) -> Void) {
        self.didAddImpeditive = didAddImpeditive
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
        view.addSubview(datePicker)
    }
    
    internal override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate(constraints)
    }

    @objc
    func pickerHandler() {
        debugPrint(datePicker.countDownDuration)
    }

    @objc func exitTap(_: UIButton){
        guard let currentCategory = currentCategory else {
            return
        }
        let impeditive = ModelController.createImpeditive(with: currentCategory,
                                                          and: currentSubcategoryValue,
                                                          for: datePicker.countDownDuration)
        didAddImpeditive(impeditive)
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
        if pickerView.tag == 1 {
            currentCategory = ImpeditiveCategories(rawValue: row)?.categoryValue
            pickerViewSubCategoria.reloadAllComponents()
            pickerViewSubCategoria.selectRow(0, inComponent: 0, animated: true)
        } else {
            currentSubcategoryValue = currentCategory?.subcategories[row].description ?? ""
        }
    }
}

