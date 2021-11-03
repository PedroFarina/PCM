//
//  ImpeditiveCategories.swift
//  PCM
//
//  Created by Pedro Farina on 28/10/21.
//

internal struct EquipmentCategory: PCMImpeditiveCategory {
    let description: String = "Equipamentos"
    let subcategories: [String] = ["Manutenção", "Combustível", "Operador", "Outros"]
    let appliesToAll: Bool = false
}
internal struct WorkerCategory: PCMImpeditiveCategory {
    let description: String = "Mão de Obra"
    let subcategories: [String] = ["Treinamento", "Acidente de Trabalho", "Outros"]
    let appliesToAll: Bool = false
}
internal struct MaterialCategory: PCMImpeditiveCategory {
    let description: String = "Material"
    let subcategories: [String] = ["Falta", "Erro de especificação", "Atraso na entrega", "Danificado", "Outros"]
    let appliesToAll: Bool = true
}
internal struct NatureCategory: PCMImpeditiveCategory {
    let description: String = "Intempérie"
    let subcategories: [String] = ["Chuva", "Vento", "Raio", "Outros"]
    let appliesToAll: Bool = true
}
