//
//  ContentView.swift
//  hogeApp
//
//  Created by 渡邊魁優 on 2023/04/19.


import SwiftUI

struct Fruit: Identifiable {
    let id = UUID()
    let name: String
    let item: [Item]
}

struct Item: Identifiable {
    let id = UUID()
    let title: String
}

struct ContentView: View {
    @State var fruits: [Fruit] = [
        Fruit(name: "りんご", item: [Item(title: "あまい"), Item(title: "赤い")]),
        Fruit(name: "ばなな", item: [Item(title: "ながい"), Item(title: "黄色い")])
    ]
    
    var body: some View {
        NavigationStack {
            List(fruits) { fruit in
                NavigationLink(destination: TargetView(fruit: fruit)) {
                    Text(fruit.name)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        fruits.append(Fruit(name: "new",
                                            item: [Item(title: "newitem"), Item(title: "newitem")]))
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct TargetView: View {
    @State var fruit: Fruit
    
    var body: some View {
        List {
            ForEach(fruit.item) { item in
                Text(item.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
