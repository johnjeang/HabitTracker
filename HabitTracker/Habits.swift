//
//  Habits.swift
//  HabitTracker
//
//  Created by John Jeang on 6/7/21.
//

import Foundation

struct Habit: Identifiable, Codable{
  let id = UUID()
  let name: String
  let hours: Double
  let description: String
// let image: String
}

class HabitList: ObservableObject{
  @Published var habitList = [Habit](){
    didSet{
      let encoder = JSONEncoder()
      if let encoded = try? encoder.encode(habitList) {
        UserDefaults.standard.set(encoded, forKey: "habitList")
      }
    }
  }
  
  init() {
    if let habitList = UserDefaults.standard.data(forKey: "habitList"){
      let decoder = JSONDecoder()
      if let decoded = try? decoder.decode([Habit].self, from: habitList){
        self.habitList = decoded
        return
      }
    }
    else{
      self.habitList = []
    }
  }
  
  
  
}
