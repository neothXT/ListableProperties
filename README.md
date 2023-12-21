# ListableProperties
ListableProperties macro allows to list all the properties of a struct, class and other types by adding static `getProperties()` func to it.
All you need to do is to add `@ListableProperties` to your model.

## Installation

ListableProperties is currently available only via SPM (Swift Package Manager)

## Basic Usage

```Swift
@ListableProperties
struct Model {
    let firstProperty: String
    let secondProperty: Int
    var thirdProperty: Bool
}

print(Model.getProperties()) // This will return ["firstProperty", "secondProperty", "thirdProperty"]
```

And that's it. Enjoy :)
