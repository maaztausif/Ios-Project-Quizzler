//
//  Question.swift
//  Quizzler
//
//  Created by maJor on 08/02/2020.
//  Copyright © 2020 maJor. All rights reserved.
//

import Foundation

class Question{
    let questionText:String
    let ans:Bool
    init(text:String,correctAnswer:Bool) {
        self.questionText = text
        self.ans = correctAnswer
    }
}
