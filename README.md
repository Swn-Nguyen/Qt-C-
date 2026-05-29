Basic Qt classes

*QObject
    - Base class for everything Qt (non-template)
    - Connect between signal and slot
    - Sender return the pointer that point to the one call slots
    - To declare a class as a QObject, it must:
        + Inherit from QObject
        + Include the Q_OBJECT macro
        + Have constructor with "QObject *parent = nullptr" 
    -  The MEMBER Method:
        + Q_PROPERTY(DataType, MEMBER, NOTIFY): link a property directly to a member variable of a class. 
        + setProperty: set the value of object's name property to value
        + property: return the value of the object's name property
    - The READ/WRITE Method:
        + Q_PROPERTY(DataType, READ, WRITE, NOTIFY): use getter, setter function to read from and write to a member variable
        + Same like MEMBER Method but can using getter and setter function same property and setProperty
    - Memory managerment:
        + When Object created with a parent, if the parent is deleted, all its childrend are deleted as well
        + Qobject can be created with a parent, by passing a parent object its constructor or using setParent()
        + The list of child objects display by children() function
    - Meta Object Compiler:
        + Scans the files for the Q_OBJECT macro and generates C++ files containing meta object code

*QDate, QTime, QDateTime
    1. ISODate (standard ISO 8601)
        - Format datetime type: YYY-MM-DDThh:mm:ss.sssZ
        - Helpful for database
        - Most API, JSON and database are default using this format
    2. RFC2822Date (Internet& Email standard)
        - Format datetime type: Day, DD Mon YYY hh:mm:ss +/-TZ
        - Ex: Tue, 19 May 2026 16:53:53 +0700
        - Should use with HTTP Header, Email,
    3. TextDate
        - Using when creat UI 

*QString
    1. Parsing
        - split(): Split a QString to a list depend on split character
        - mid(int position, int length) ~ substring
        - left(int n)/right(int n): return the character in the left or right of QString
    2. Search & Compare
        - contains(const QString &str, Qt::CaseSensitivity cs): return bool variable
        - indexOf(const QString &str) ~ find
        - startWith()/endWith(): check if QString start/end by a keyword
    3. Formatting
        - arg(): string interpolation 
        - ex: QString msg = QString("Server %1 có ID là %2").arg(name).arg(id);
        - append()/+-
        - replace(before, after)
        - trimmed(): Cutting all whitespace of start and end of QString
    4. Conversion
        - toInt(), toDouble(),...
        - Always using flag bool *ok 
        - Ex: bool isOk;
        int id = QString("1024").toInt(&isOk, 10); // Cơ số 10
        if(!isOk) { /* Xử lý lỗi ép kiểu */ }
    5. Check status
        - length()/size()
        - isEmpty()/isNull()

*QByteArray, QVariant, QStringList
    