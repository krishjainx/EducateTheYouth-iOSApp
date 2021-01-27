//
//  QuestionBank.swift
//  Sample Marbella
//
//  Created by KRISH JAIN on 22/11/2020.
//

import Foundation


class QuestionBank{
    
    var list = [Question]()
    
    init() {
        
        list.append(Question(image: "mansittingnexttotreereading.jpg", questionText: "Which country has longest school day?", choiceA: "India", choiceB: "Spain", choiceC: "Taiwan", choiceD: "Germany", answer: 3))
        
        list.append(Question(image: "mansittingnexttotreereading.jpg", questionText: "Where is the world's oldest school located?", choiceA: "Greece", choiceB: "England", choiceC: "Sri Lanka", choiceD: "Canada", answer: 2))
        list.append(Question(image: "mansittingnexttotreereading.jpg", questionText: "In which country does school end by noon so children can go home by noon?", choiceA: "Cuba", choiceB: "Brazil", choiceC: "Mexico", choiceD: "Argentina", answer: 2))
        list.append(Question(image: "mansittingnexttotreereading.jpg", questionText: "Which country's school system is considered one of the best in Europe's education ranking?", choiceA: "Norway", choiceB: "France", choiceC: "Finland", choiceD: "Scotland", answer: 3))
        
        list.append(Question(image: "mansittingnexttotreereading.jpg", questionText: "In which country do children start school on the day they turn 4?", choiceA: "lceland", choiceB: "Holland", choiceC: "Canada", choiceD: "South Africa", answer: 2))
        
        list.append(Question(image: "mansittingnexttotreereading.jpg", questionText: "Which country's students are considered the most independent?", choiceA: "India", choiceB: "Japan", choiceC: "China", choiceD: "USA", answer: 2))
        
        
        list.append(Question(image: "mansittingnexttotreereading.jpg", questionText: "In which country do children start school at age of 7?", choiceA: "Singapore", choiceB: "Finland", choiceC: "Bangladesh", choiceD: "Turkey", answer: 2))
//        
//        list.append(Question(image: "mansittingnexttotreereading.jpg", questionText: "Where is the world's highest school located?", choiceA: "Tibet", choiceB: "China", choiceC: "India", choiceD: "Uruguay", answer: 1))
        
        list.append(Question(image: "mansittingnexttotreereading.jpg", questionText: "Which country below spends the most on education?", choiceA: "Sweden", choiceB: "Norway", choiceC: "Finland", choiceD: "Germany", answer: 2))
        
        list.append(Question(image: "mansittingnexttotreereading.jpg", questionText: "How many children around the world are missing out on primary school?", choiceA: "Around 61 million", choiceB: "Around 35 million", choiceC: "Around 20 million", choiceD: "Around 75 million", answer: 1))
        
        list.append(Question(image: "mansittingnexttotreereading.jpg", questionText: "Which country has the largest number of children missing out on school?", choiceA: "India", choiceB: "China", choiceC: "Egypt", choiceD: "Nigeria", answer: 4))
        
        list.append(Question(image: "mansittingnexttotreereading.jpg", questionText: "Which country has shortest school year?", choiceA: "France", choiceB: "England", choiceC: "Austria", choiceD: "Belgium", answer: 1))
        
        list.append(Question(image: "mansittingnexttotreereading.jpg", questionText: "Which university has produced more presidential candidates in the last 30 years than any other university?", choiceA: "Harvard", choiceB: "Yale", choiceC: "Princeton", choiceD: "Cornell", answer: 2 ))
    }
}
