//
//  User.swift
//  Foodly
//
//  Created by Helen on 25.07.2025.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
