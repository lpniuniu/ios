//
//  RealmDemoTests.swift
//  RealmDemoTests
//
//  Created by familymrfan on 16/12/27.
//  Copyright © 2016年 niuniu. All rights reserved.
//

import XCTest
import RealmSwift

class BookData: Object {
    dynamic var id = ""
    dynamic var name = ""
    dynamic var age = 0
    dynamic var date = NSDate()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class RealmDemoTests: XCTestCase {
    
    var realm:Realm? = nil
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print("\(documentsPath)")
        
        var config = Realm.Configuration.defaultConfiguration
        config.schemaVersion = 6
        // 数据库升级
        config.migrationBlock = { migration, oldSchemaVersion in
            if oldSchemaVersion < 6 {
                migration.enumerateObjects(ofType: BookData.className(), { (oldObject, newObject) in
                    newObject!["date"] = NSDate()
                })
            }
        }
        Realm.Configuration.defaultConfiguration = config
        realm = try! Realm()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRealmAdd() {
        let book = BookData()
        book.id = NSUUID().uuidString
        book.name = "ff"
        book.age = 100
        try! realm?.write {
            realm?.add(book)
        }
    }
    
    func testRealmGet() {
        let result = realm?.objects(BookData.self)
        for b in result! {
            print("\(b)")
        }
    }
    
    func testRealmDelete() {
        let result = realm?.objects(BookData.self)
        try! realm?.write({
            realm?.delete((result?.first)!)
        })
        print("---------- \(realm?.objects(BookData.self).count)")
    }
    
    func testRealmUpdate() {
        let result:BookData = (realm?.objects(BookData.self).first!)!
        try! realm?.write({
            result.name = "网易一千零一夜"
        })
    }
    
}
