class DataCollection {
    var list: Array<AnyObject> = []

    func all() -> Array<AnyObject> {
        print(list)
        return list
    }

    func count() -> Int {
        return list.count
    }

    func jaTextAtIndex(index: Int) -> String {
        let data = list[index] as! Data
        return data.jaText
    }
}


