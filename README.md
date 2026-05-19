Basic Qt classes

*QObject
    - Base class for everything Qt (non-template)
    - Connect between signal and slot
    - Sender return the pointer that point to the one call slots

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
    