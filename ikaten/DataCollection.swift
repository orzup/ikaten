class DataCollection {
    private var list: Array<Data> = []

    func all() -> Array<Data> {
        return list
    }

    func first() -> Data {
        return list[0]
    }

    func second() -> Data {
        return list[1]
    }

    func third() -> Data {
        return list[2]
    }

    func append(data: Data) {
        list.append(data)
    }

    func count() -> Int {
        return list.count
    }

    func dataAtIndex(index: Int) -> Data {
        let data = list[index]
        return data
    }

    func nameAtIndex(index: Int) -> String {
        let data = list[index]
        return data.name
    }

    func indexOf(name: String) -> Data? {
        for data in list {
            if data.name == name {
                return data
            }
        }
        return nil
    }
}
