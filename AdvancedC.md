                                                                                                                                                                                                                                                            # Advanced C Progaming
## Memory Allocation
### Stack
* Là một phân vùng đặc biệt lưu trữ các biến tạm thời
    * Thường dùng để lưu trữ các biến được tạo trong 1 hàm
    * Dễ dàng theo dõi bởi dữ liệu chỉ khả dụng cục bộ trong hàm
* Cấu trúc của Stack là LIFO (Last in first out) được quản lý và tối ưu bởi CPU
    * Là cấu trúc dữ liệu tuyến tính
    * Không cần phải quản lý bộ nhớ
        * Dữ liệu được phân bổ và giải phóng tự động 
* Stack dãn ra và co lại khi các biến được tạo và hủy bên trong 1 hàm
    * Mỗi khi 1 hàm khai báo biến mới, biến đó sẽ được đẩy vào stack
    * Mỗi khi hàm kết thúc, tất cả các biến mà hàm đó đẩy vào stack sẽ được giải phóng
    * Một khi biến trong ngăn xếp được giải phóng, vùng bộ nhớ đó sẽ trở nên khả dụng cho các biến khác trong ngăn xếp
* Có giới hạn kích thước của biến có thể lưu trong bộ nhớ Stack
* Nếu đưa quá nhiều dữ liệu vào stack có thể dẫn tới Stack overflow
    * Xảy ra khi tất cả các bộ nhớ trong stack đã được phân bổ và tràn vào các phần khác của bộ nhớ.
    * Đệ quy là nguyên nhân thường gặp nhất 

### Heap
* Là một cấu trúc dữ liệu phân cấp
* Là một vùng bộ nhớ có thể được sử dụng linh hoạt
* Không tự động quản lý bộ nhớ
* Heap được quản lý bởi lập trình viên
    * Bộ nhớ được sử dụng thông qua việc dùng con trỏ
        * Bạn phải phân bổ rõ ràng (malloc) và hủy phân bổ (free) bộ nhớ
        * Không giải phóng bộ nhớ khi hoàn tất sẽ dẫn đến việc rò rỉ bộ nhớ (memory leak)
* Không giới hạn bộ nhớ
* Truy cập chậm (so với stack)
* Các biến có thể thay đổi kích thước bằng việc sử dụng realloc

### Automatic variables
1. Auto Storage Class
* C cung cấp 4 lớp lưu trữ:
    * auto
    * register
    * extern
    * static
2. Local Variables
3. External Variables 
4. Static 
* Có thể sử dụng trên các biến local và global và function
* Khi áp dụng vào biến local, biến được tồn tại trong suốt toàn bộ vòng đời của chương trình 
* Khi áp dụng vào biến global, chỉ có thể truy cập được trong tệp chứa biến đó
* Khi áp dụng với hàm, hàm static chỉ có thể được gọi bên trong file đó
* Biến static chưa được khởi tạo (hoặc khởi tạo = 0) nằm ở BSS segment, nếu được khởi tạo khác 0 nằm ở Data Segment okey 

### Register
* Là một tập hợp nhỏ các nơi lưu trữ dữ liệu (một phần của bộ xử lý máy tính)
    * Một thanh ghi có thể chứa 1 lệnh, một địa chỉ lưu trữ hoặc bất kỳ loại dữ liệu nào
* Lớp lưu trữ thanh ghi được sử dụng để định nghĩa các biến cục bộ được lưu trữ trong  thanh ghi thay vì RAM
 * Điều đó làm cho biến thanh ghi (register variables) nhanh hơn so với biến lưu trữ trong bộ nhớ trong quá trình chạy chương trình
* Không thể lấy địa chỉ của một biến thanh ghi bằng cách sử dụng con trỏ
    * Không thể áp dụng toán tử & (vì nó không có vị 
    trí bộ nhớ)
* Không được đặt biến thanh ghi làm biến toàn cục 

* **Summary** 

Storage Class | Declaration Location | Scope<br>(Visibility) | Lifetime<br>(Alive)
---|---|---|---
auto | Inside a function/block | Within the function/block | Until the function/block completes
register | Inside a function/block | Within the function/block | Until the function/block completes
extern | Outside all functions | Entire file plus other files where the variable is declaresd as extern | Until the program terminates
static<br>(local) | Inside a function/block | Within the function/block biz| Until the program terminates
static<br>(global) | Outside all function | Entire file in which it is declared | Until the function/block completes

## Smart pointers

### Khái Niệm Cơ Bản
* Smart pointers là các class wrappers được thiết kế để tự động quản lý bộ nhớ
* Giải quyết vấn đề **Memory Leak** khi sử dụng raw pointers
* Tuân theo nguyên lý **RAII (Resource Acquisition Is Initialization)**
* Tự động giải phóng bộ nhớ khi không còn sử dụng

### Các Loại Smart Pointers

#### **1. `unique_ptr` - Quyền Sở Hữu Độc Quyền**
```cpp
#include <memory>

std::unique_ptr<int> ptr1(new int(5));
// Hoặc (C++14 trở lên - TỐT HƠN)
auto ptr2 = std::make_unique<int>(10);

// Không thể copy, chỉ có thể move
std::unique_ptr<int> ptr3 = std::move(ptr1);  // ✓ Ok
// std::unique_ptr<int> ptr4 = ptr1;  // ✗ Lỗi - không thể copy
```
* Chỉ một con trỏ sở hữu một object
* Không thể copy, chỉ có thể move
* Hiệu suất tốt nhất - gần như không có overhead
* Khi unique_ptr bị hủy, object được tự động xóa
* Dùng khi: Một object chỉ thuộc về một owner duy nhất

#### **2. `shared_ptr` - Quyền Sở Hữu Chung**
```cpp
std::shared_ptr<int> ptr1(new int(5));
auto ptr2 = std::make_shared<int>(10);  // TỐT HƠN

std::shared_ptr<int> ptr3 = ptr1;  // ✓ Ok - chia sẻ quyền sở hữu
std::shared_ptr<int> ptr4 = ptr2;  // ✓ Ok

// Reference count tự động tăng/giảm
// Object được xóa khi reference count = 0
```
* Nhiều con trỏ có thể cùng sở hữu một object
* Sử dụng reference counting để quản lý bộ nhớ
* Có overhead (quản lý ref count)
* An toàn khi chia sẻ ownership
* Dùng khi: Nhiều parts của code cần sở hữu cùng một object

#### **3. `weak_ptr` - Quan Sát Mà Không Sở Hữu**
```cpp
std::shared_ptr<int> sp = std::make_shared<int>(5);
std::weak_ptr<int> wp = sp;  // Quan sát mà không sở hữu

// Phải convert về shared_ptr trước khi dùng
if (auto sp2 = wp.lock()) {
    std::cout << *sp2 << std::endl;
} else {
    std::cout << "Object đã bị xóa" << std::endl;
}
```
* Quan sát object nhưng không sở hữu nó
* Không tăng reference count
* Phải check validity bằng .lock() trước sử dụng
* Dùng để tránh circular reference (vòng lặp tham chiếu)
* Dùng khi: Cần refer đến object mà không chịu trách nhiệm lifecycle

### Vấn Đề Circular Reference - Memory Leak

```cpp
class Node {
public:
    std::shared_ptr<Node> next;
};

// ✗ NGUY HIỂM - Circular reference, memory leak!
auto a = std::make_shared<Node>();
auto b = std::make_shared<Node>();
a->next = b;
b->next = a;
// Ref count: a=2, b=2 → Không bao giờ xóa được!
// Khi scope kết thúc, ref count chỉ giảm xuống 1, không được xóa

// ✓ GIẢI PHÁP - Dùng weak_ptr
class Node {
public:
    std::shared_ptr<Node> next;
    std::weak_ptr<Node> prev;  // ← Giải quyết circular ref
};
```

### Bảng So Sánh Smart Pointers

| Tiêu chí | Raw Pointer | unique_ptr | shared_ptr | weak_ptr |
|---|---|---|---|---|
| Quyền sở hữu | Không rõ | Độc quyền | Chia sẻ | Không sở hữu |
| Copy | ✓ Thoải mái | ✗ Không được | ✓ Được | ✓ Được |
| Move | ✓ | ✓ | ✓ | ✓ |
| Overhead | Không | Gần như không | Có (ref count) | Có (ref count) |
| Giải phóng | Thủ công | Tự động | Tự động | - |
| Circular Ref | Có nguy hiểm | Không | Có nguy hiểm | Giải quyết |
| Sử dụng khi | Không rõ | 1 owner | Nhiều owners | Avoid circular ref |

### Best Practices

```cpp
// ✓ TỐT: Dùng make_unique / make_shared
auto ptr1 = std::make_unique<int>(5);
auto ptr2 = std::make_shared<std::string>("hello");
// Lý do: Exception safety, atomic, không có intermediate raw pointer

// ✗ TRÁNH: new/delete với smart pointer
std::unique_ptr<int> ptr3(new int(5));  // Vẫn ok nhưng không tốt

// ✓ TỐT: Hàm trả về unique_ptr
std::unique_ptr<int> createObject() {
    return std::make_unique<int>(10);  // Move semantics
}

// ✓ TỐT: Hàm nhận unique_ptr
void processObject(std::unique_ptr<int> ptr) {
    // Sở hữu object, sẽ tự động xóa khi hàm kết thúc
}

// ✓ TỐT: Nhận by reference để không transfer ownership
void useObject(const std::unique_ptr<int>& ptr) {
    std::cout << *ptr << std::endl;  // Chỉ dùng, không sở hữu
}

// ✗ TRÁNH: Giữ raw pointer từ smart pointer lâu dài
auto ptr = std::make_unique<int>(5);
int* raw = ptr.get();  // Có thể, nhưng nguy hiểm nếu ptr bị xóa
```

### Câu Hỏi Phỏng Vấn Thường Gặp

**Q: Sự khác biệt giữa `unique_ptr` và `shared_ptr`?**
- A: unique_ptr = quyền sở hữu độc quyền (không copy), shared_ptr = quyền sở hữu chung qua reference counting

**Q: Khi nào dùng `weak_ptr`?**
- A: Để tránh circular reference trong shared_ptr (parent-child relationships, graph structures, caching)

**Q: Tại sao `make_unique` và `make_shared` tốt hơn `new`?**
- A: Exception safety, không có intermediate raw pointer, atomic allocation + assignment, tối ưu hơn

**Q: Có overhead nào khi dùng smart pointers?**
- A: shared_ptr có overhead (reference counting + synchronization), unique_ptr gần như không (zero-cost abstraction)

**Q: Làm sao để tránh memory leak với smart pointers?**
- A: Tránh circular references, dùng weak_ptr khi cần, không lưu raw pointers lâu dài, dùng make_unique/make_shared

## Threads
* Một Thread có unique id, program counter (PC), thanh ghi và một không gian ngăn sếp giống process
* Threads là một cách để chia một process thành nhiều phần có thể chạy phụ
* Threads chia sẻ bộ nhớ trên mỗi luồng bằng cách có cùng một không gian, địa chỉ
    * 2 threads có quyền truy cập vào cùng 1 biến và thay đổi giá trị biến đó
        * Nếu 1 thread thay đổi 1 biến cục bộ, tất cả các thread khác sẽ thấy sự thay đổi đó ngay lập tức
* Thread cũng chia sẻ tài nguyên với OS như các tệp hoặc signals
* **NOTE**: các *processes* không chia sẻ cùng một không gian địa chỉ

### Creating a thread
* Các hàm tạo nên API thread có thể được chia thành 3 nhóm chính
    1. Quản lý thread 
        - Các quy trình làm việc trực tiếp trên luồng: creating, detaching, joining, etc
        - Cũng bao gồm các hàm để thiết lập/ truy vấn các thuộc tính của luồng (joinable, scheduling)
    2. Synchronization
        - Các quy trình quản lý khóa đọc/ghi và bariers và deal với đồng bộ hóa
        - Các hàm mutex cung cấp tính năng như: creating, destroying, locking và unclocking mutexes 
* Tạo thread
    <br>`pthread_create`(linux) 
    <br>`CreateThread`(Windows)
    - Cần phải có một con trỏ kiểu void
    - NULL nếu không có đối số nào được truyền vào
    - Để truyền nhiều tham số, cần phải sử dụng con trỏ struct
* Join thread
    <br>`pthread_join`(linux)
    <br>`WaitForSingleObject` / `WaitForMultipleObjects` (Windows)
    - Tham số đầu tiên truyền vào là ID của thread mà bạn muộn đợi
    - Nếu tham số thứ 2 không phải là NULL, giá trị này sẽ được truyền vào pthread_exit() bởi luồng kết thúc 
* pthread_exit
    <br>`pthread_exit`(linux)
    <br>`thread return`(Windows)
    - threads có thể kết thúc băng rất nhiều cách
        1. Gọi pthread_exit
        2. Để thread return
        3. Gọi function exit để kết thúc process chứa các threads
    - Thông thường, thủ tục pthread_exit() được gọi sau khi một thread đã thành công và không cần thiết tồn tại nữa
    - Nếu main() finishs trước khi các threads được nó tạo ra finish, và exit bằng pthread_exit() thì các threads đó sẽ được tiếp tục chạy
        - Nói cách khác, threads sẽ tự động kết thúc khi main() finishes 
    - Mặc dù không bắt buộc yêu cầu gọi pthread_exit() ở cuối thread function nhưng nên làm
* Các hàm thường dùng
    Linux(POSIX) | Windows (Win32) | Tính năng
    --- | --- | ---
    pthread_create() | CreateThread() | Tạo thread
    pthread_exit (retval) | return retval hoặc ExitThread(retval) | Kết thúc thread
    pthread_join (tid, &retval) | WaitForSingleObject() + GetExitCodeThread() | Đợi + lấy return value
    pthread_cancel (tid) | TerminateThread(hThread, code) | Ép kill thread
    pthread_self () | GetCurrentThreadId() | Lấy thread ID hiện tại 

### Race conditions
* Khi các luồng đang thực thi `racing to complete`, chúng có lẽ sẽ đưa ra các kết quả không đoán trước được `race condition`
* Một `race condition` thường xảy ra khi hai hoặc nhiều luồng cần thực hiện các thao tác giống nhau trên cùng vùng nhớ
    - Nhưng kết quả phụ thuộc vào thứ tự thực hiện các thao tác này
* Điều này cũng xảy ra khi các câu lệnh read/write nhận một lượng lớn dữ liệu gần như cùng một lúc
    - Thiết bị sẽ cố gắng ghi đè lên một hoặc tất cả các dữ liệu cũ trong khi dữ liệu này vẫn đang được đọc.

### Deadlocks
* Điều này có thể xảy ra khi nhiều luồng đang cố truy cập vào tài nguyên được chia sẻ
* Trường hợp xảy ra là khi hai luồng đang chia sẻ cùng một tài nguyên và đang cố ngăn chặn 
    - Điều này sẽ khiến chương trình bị halt vô thời hạn
    - Mỗi luồng sẽ chờ luồng còn lại
* `Dining philosophers` là một ví dụ phổ biến về deadlock
