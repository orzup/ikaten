class DataCollection {
    private var list: Array<Data> = []

    init() {
    }

    init(let _ params: Array<Dictionary<String, AnyObject>>) {
        for param in params {
            list.append(Data(param))
        }
    }

    init(let _ data: Array<Data>){
        for datum in data {
            list.append(datum)
        }
    }

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
