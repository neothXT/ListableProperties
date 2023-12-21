import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(ListablePropertiesMacros)
import ListablePropertiesMacros

let testMacros: [String: Macro.Type] = [
    "ListableProperties": ListablePropertiesMacro.self,
]
#endif

final class ListablePropertiesTests: XCTestCase {
    func testMacro() throws {
        #if canImport(ListablePropertiesMacros)
        assertMacroExpansion(
            """
            @ListableProperties
            struct Model {
                let firstLet: String
                let secondLet: Int
                var firstVar: Bool
                var secondVar: Double
            }
            """,
            expandedSource: """
            
            struct Model {
                let firstLet: String
                let secondLet: Int
                var firstVar: Bool
                var secondVar: Double
            }
            
            extension Model {
                static func getProperties() -> [String] {
                    ["firstLet", "secondLet", "firstVar", "secondVar"]
                }
            }
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
