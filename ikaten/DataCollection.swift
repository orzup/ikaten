class DataCollection {
    private var list: Array<AnyObject> = []

    func all() -> Array<AnyObject> {
        return list
    }

    func append(data: Data) {
        list.append(data)
    }

    func count() -> Int {
        return list.count
    }

    func dataAtIndex(index: Int) -> Data {
        let data = list[index] as! Data
        return data
    }

    func nameAtIndex(index: Int) -> String {
        let data = list[index] as! Data
        return data.name
    }
}
