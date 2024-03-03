//
//  MainViewModel.swift
//  testProjectStartup
//
//  Created by Enzhe Gaysina on 03.03.2024.
//

import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    @Published var lists: [[Int]] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
	   generateRandomLists()
	   startUpdatingNumbers()
    }
    
    func generateRandomLists() {
	   guard lists.isEmpty else { return }
	   
	   let numberOfLists = Int.random(in: 100...120)
	   var newLists = [[Int]]()
	   
	   for _ in .zero..<numberOfLists {
		  let randomNumbersCount = Int.random(in: 10...20)
		  let randomNumbers = (.zero..<randomNumbersCount).map { _ in
			 Int.random(in: .zero...120)
		  }
		  newLists.append(randomNumbers)
	   }
	   self.lists = newLists
    }
    ///timer for updating numbers
    func startUpdatingNumbers() {
	   Timer.publish(every: 1, on: .main, in: .default)
		  .autoconnect()
		  .sink { [weak self] _ in
			 self?.updateNumbers()
		  }
		  .store(in: &cancellables)
    }
    
    func updateNumbers() {
	   for i in .zero..<lists.count {
		  if let randomIndex = lists[i].indices.randomElement() {
			 lists[i][randomIndex] = Int.random(in: .zero...120)
		  }
	   }
    }
}
