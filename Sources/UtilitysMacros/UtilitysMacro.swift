import SwiftCompilerPlugin
import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

@main
struct UtilitysPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        DomainConverter.self,
    ]
}
