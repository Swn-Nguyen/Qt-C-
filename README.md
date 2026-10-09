# QObject
* Base class for everything Qt (non-template)
* Connect between signal and slot
* Sender return the pointer that point to the one call slots
* To declare a class as a QObject, it must:
    * Inherit from `QObject`
    * Include the `Q_OBJECT` macro
    * Have constructor with `QObject *parent = nullptr`
##  The `MEMBER` Method:
* `Q_PROPERTY(DataType, MEMBER, NOTIFY)`: link a property directly to a member variable of a class. 
* `setProperty`: set the value of object's name property to value
* `property`: return the value of the object's name property
## The `READ/WRITE` Method:
* `Q_PROPERTY(DataType, READ, WRITE, NOTIFY)`: use getter, setter function to read from and write to a member variable
* Same like `MEMBER` Method but can using getter and setter function same property and setProperty
## Memory managerment:
* When Object created with a parent, if the parent is deleted, all its childrend are deleted as well
* Qobject can be created with a parent, by passing a parent object its constructor or using `setParent()`
* The list of child objects display by `children()` function
## Meta Object Compiler (MOC):
* Scans the files for the `Q_OBJECT` macro and generates C++ files containing meta object code
* Convert the class into a true Qobject
## Signals and Slots
* *Signals*: 
    * Always public
    * Always defined 
    * Never implimented
* *Slots*:
    * Can be public, private, protected
    * Always defined and implimented
    * Should match parameter of the signal
* *Connnect*:
    * Syntax: `QObject::connect(&Object1, &Signal, &Object2, &Slot, Connection)`
    * Have to connect the two object
    * Dont make multiple connections to the same signal and slot 
    * Can have connection type, default is `AutoConnection`
## Disable copy
> __QOjbect can not be copied__: The memory address is the objects identity 

# QDate, QTime, QDateTime
1. ISODate (standard ISO 8601)
    * Format datetime type: YYY-MM-DDThh:mm:ss.sssZ
    * Helpful for database
    * Most API, JSON and database are default using this format
2. RFC2822Date (Internet& Email standard)
    * Format datetime type: Day, DD Mon YYY hh:mm:ss +/-TZ
    * Ex: Tue, 19 May 2026 16:53:53 +0700
    * Should use with HTTP Header, Email,
3. TextDate
    * Using when creat UI 

# QString
1. Parsing
    * `split()`: Split a QString to a list depend on split character
    * `mid(int position, int length)` ~ substring
    * `left(int n)`/`right(int n)`: return the character in the left or right of QString
2. Search & Compare
    * `contains(const QString &str, Qt::CaseSensitivity cs)`: return bool variable
    * `indexOf(const QString &str)` ~ `find`
    * `startWith()`/`endWith()`: check if QString start/end by a keyword
3. Formatting
    * `arg()`: string interpolation 
        * ex: 
            ```cpp
            QString msg = QString("Server %1 có ID là %2").arg(name).arg(id);
            ```
    * `append()`/+-
    * `replace(before, after)`
    * `trimmed()`: Cutting all whitespace of start and end of QString
4. Conversion
    * `toInt()`, `toDouble()`,...
    * Always using flag bool *ok 
        * ex: 
            ```cpp
            bool isOk;
            int id = QString("1024").toInt(&isOk, 10); // Cơ số 10
            if(!isOk) { /* Xử lý lỗi ép kiểu */ }
            ```
5. Check status
    * `length()`/`size()`
    * `isEmpty()`/`isNull()`

# Smart Pointers

## QScopedPointer
* Allocated on the heap
* Automatically free pointer memory when going out of scope
* Key features:
    * RAII: standing for "Resource Acquisition Is Initialization" mechanism, ensuring the object is safely deleted when the QScopedPointer is destroyed. 
    * Non-copyable
```cpp
    QScopedPointer<ClassName> obj(new Class());
```
## QSharedPointer
* Will delete the pointer it is holding when it goes out of scope

```cpp
    QSharedPointer<ClassName> obj(new Class());
```

# Collections
## QList
* Append
    ```cpp
        QList <int> list;
        //Easy append
        list << 1 << 2 << 3;
        list.append(1);
    ```
* Size and count
    * `length()` same as `size()` and `count()`
    * If `count(value)` takes parameter, it returns the number of occurrences of ***value*** in the list
    * `replace(a, b)`
    * `remove(a)`: remove only one first value found
    * `removeAll(a)`: remove all element equal value in the list
    * `slice(index, numpl)` 


## QVector
* *An alias of QList*
## QSet
* Implimentation:
    ```cpp
    #include <QSet>

    QSet<QString> people;
    ```
* Insert: 
    ```cpp
    people << "Son" << "Tammy" << "Bryan";
    // or
    people.insert("name");
    ```

## QMap
* Implimentation
    ```cpp
    #include <QMap>

    QMap<String, int> ages;
    ```
* Insert
    ```cpp
    ages.insert(Key, value);
    ```
* Query
    ```cpp
    qInfo() << "Keys" << ages.keys();
    qInfo() << "Keys" << ages.values();
    qInfo() << ages["name"];
    ```
## QStringList
* Implimentation
    ```cpp
    #include <QStringList>

    QStringList names;
    ```
* Insert
    ```cpp
    names << "Son" << "dep" << "trai";
    // or
    names.append("lop 12");
    ```
## qDeleteAll with QList
* Delete all the items in the range using the Cpp `delete` operator
* The item type must be  pointer type
* `qDeleteAll` doesn't remove the items. Have to use `clear()` to remove the items

