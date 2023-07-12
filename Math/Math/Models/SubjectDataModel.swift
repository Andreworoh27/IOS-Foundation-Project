//
//  Subject.swift
//  Math
//
//  Created by Andrew Oroh on 10/07/23.
//

import Foundation

struct SubjectDataModel: Identifiable{
    var id = UUID()
    var subjectCategory: String
    var subjectCount: Int
    var subjectDescription: String
    var subjectLevelCount: Int
    var subjectTitle: String
    var colorHex: String
}


