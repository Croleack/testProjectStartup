//
//  ContentView.swift
//  testProjectStartup
//
//  Created by Enzhe Gaysina on 03.03.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var store = MainViewModel()
    
    var body: some View {
	   ScrollView {
		  LazyVStack(spacing: Constants.horizontalSpacing) {
			 ForEach(store.lists.indices, id: \.self) { index in
				HorizontalListView(numbers: $store.lists[index])
			 }
		  }
	   }
	   .padding(.horizontal, Constants.horizontalPadding)
    }
}
// MARK: - Constants
fileprivate extension MainView {
    enum Constants {
	   static let horizontalSpacing: CGFloat = 10.0
	   static let horizontalPadding: CGFloat = 16.0
    }
}
