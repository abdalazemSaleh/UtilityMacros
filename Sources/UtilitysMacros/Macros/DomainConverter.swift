//
//  DomainConverter.swift
//  Utilitys
//
//  Created by Abdalazem Saleh on 15/11/2024.
//

import SwiftCompilerPlugin
import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct DomainConverter: ExtensionMacro {
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {
        /// Get domain model name
        guard let argument = node.arguments?._syntaxNode else {
            fatalError("compiler bug: the macro does not have any arguments")
        }
        let DomainModel = argument
        
        /// Check Macro type
        let type = `Type`(declaration)
                
        print(type.allProperties.map { $0.type })
        
        /// Map Current Model To Domain Model
        let params = type.allProperties.map { "\($0.name): self.\($0.name) ?? \(getDefultValue($0.type))" }.joined(separator: ",\n")
        
        let accessModifier: String = if let modifier = type.accessModifier { "\(modifier) " } else { "" }
        
        return [
            try ExtensionDeclSyntax("\(raw: accessModifier)extension \(raw: type.name)") {
                """
                func toDomain() -> \(raw: DomainModel) {
                    return \(raw: DomainModel)(
                        \(raw: params)
                    )
                }
                """
            }
        ]
    }
}
