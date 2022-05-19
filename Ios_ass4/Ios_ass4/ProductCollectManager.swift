//
//  ProductCollectManager.swift
//  Ios_ass4
//
//  Created by Chanzhe on 2022/5/15.
//

import UIKit

private struct SubscribeItem{
    let key: String
    let action: (Product) -> Void
}

class ProductCollectManager {

    static let shared = ProductCollectManager()
    
    private(set) var list: [Product] = [] //External cannot be modified but can be accessed
    private var idSet: Set<Int> = Set()
    
    private let lock = DispatchSemaphore(value: 1) //Thread blocking processing
    
    private var subscribeList: [SubscribeItem] = []
    
    private var dataUrl: URL {
        var url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        url.appendPathComponent("FavouriteProducts.json")
        return url
    }
    
    func subscribe(_ action: @escaping (Product) -> Void) -> String {
        let item = SubscribeItem(key: UUID().uuidString, action: action) // every time subscribe creat a id
        subscribeList.append(item)
        return item.key //unique key
    }

    func unsubscribe(_ key: String){
        subscribeList = subscribeList.filter { $0.key != key}
    }

    
// Check the data saved on disk and read it
    
    func loadDataIfNeeded(){
        if !list.isEmpty { return }
        
        DispatchQueue.global().async {
            
            var newSet = Set<Int>()
            var newList = [Product]()
            let list = self.loadDataSync()
            
            for product in list {
                if newSet.contains(product.id) { continue }
                newSet.insert(product.id)
                newList.append(product)
            }
            
            DispatchQueue.main.async {
                self.idSet = newSet
                self.list = newList
            }
        }
    }
    
    func checkCollect(_ product: Product) -> Bool{
        idSet.contains(product.id)
    }
    
    //collection saving is implemented through asynchronous functions
    func collectProduct(_ product: Product){ //outer func
        if idSet.contains(product.id){
            idSet.remove(product.id)
            if let index = list.firstIndex(where: { $0.id == product.id}) {
                list.remove(at: index)
            }
        }else{
            idSet.insert(product.id)
            list.insert(product, at: 0)
        }
        
        let list = self.list // Copy the list to the child counties to avoid threading errors
        DispatchQueue.global().async{ //save in disk
            self.saveDataSync(list)
        }
        for item in subscribeList {
            item.action(product)
        }
    }
    
    private func loadDataSync() -> [Product] {  //inner func
        lock.wait()
        let data = try? Data(contentsOf: dataUrl)
        lock.signal()
        
        if let data = data,
            let list = try? JSONDecoder().decode([Product].self, from: data) {
            return list
        }
        return []
    }
    
    private func saveDataSync(_ list:[Product]){
        if let data = try? JSONEncoder().encode(list){
            lock.wait()
            try? data.write(to: dataUrl)
            lock.signal()
        }
    }
}
