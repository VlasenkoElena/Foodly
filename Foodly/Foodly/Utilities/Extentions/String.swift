//
//  String.swift
//  Foodly
//
//  Created by Helen on 24.07.2025.
//
import Foundation
import RegexBuilder

extension String {
    
    var isValidEmail: Bool {
//   -MARK for IOS less 16
//        let emailFormat = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,64}$"
//        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
//        return emailPredicate.evaluate(with: self)
        
        let emailFormat = Regex {
            OneOrMore {
                CharacterClass(
                    .anyOf("._%+-"),
                    ("A"..."Z"),
                    ("a"..."z"),
                    ("0"..."9")
                )
            }
            "@"
            OneOrMore {
                CharacterClass(
                    .anyOf("-"),
                    ("A"..."Z"),
                    ("a"..."z"),
                    ("0"..."9")
                )
            }
            /./
            Repeat(2...64) {
                CharacterClass(
                ("A"..."Z"),
                ("a"..."z")
                )
            }
        }
        
        return self.wholeMatch(of: emailFormat) != nil
    }
}
