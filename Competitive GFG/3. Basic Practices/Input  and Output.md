## Ranges of input And Output

---

| **Data type**          | **Range of input/output values**  |
| ---------------------- | --------------------------------- |
| **int**                | -2.15 x 10^9 to 2.15 x 10^9       |
| **unsigned int**       | 0 to 4.29 x 10^9                  |
| **long**               | -2.15 x 10^9 to 2.15 x 10^9       |
| **unsigned long**      | 0 to 4.29 x 10^9                  |
| **long long**          | -9.22 x 10^18 to 9.22 x 10^18     |
| **unsigned long long** | 0 to 18.44 x 10^18                |
| **float**              | ±1.18 x 10^-38 to ±3.40 x 10^38   |
| **double**             | ±2.23 x 10^-308 to ±1.79 x 10^308 |
| **char**               | -128 to 127                       |
| **bool**               | **true** or **false**             |

Note that these ranges are based on typical implementations and may vary depending on the specific platform being used. It's always important to consult the documentation or specifications for the specific data types being used to get more accurate and detailed information about their ranges.

# C++ Tricks For Competitive Programming

---

In competitive programming, it is important to read input as fast as possible so we save valuable time.

You must have seen various problem statements saying: “_**Warning:** Large I/O data, be careful with certain languages (though most should be OK if the algorithm is well designed)”_. The key for such problems is to use Faster I/O techniques. 

It is often recommended to use scanf/printf instead of cin/cout for fast input and output. However, you can still use cin/cout and achieve the same speed as scanf/printf by including the following two lines in your main() function:

    ios_base::sync_with_stdio(false);

It toggles on or off the synchronization of all the C++ standard streams with their corresponding standard C streams if it is called before the program performs its first input or output operation. Adding ios_base::sync_with_stdio (false); (which is true by default) before any I/O operation avoids this synchronization. It is a static member of the function of std::ios_base. 

	 cin.tie(NULL);

tie() is a method that simply guarantees the flushing of std::cout before std::cin accepts an input. This is useful for interactive console programs which require the console to be updated constantly but also slows down the program for large I/O. The NULL part just returns a NULL pointer.

Moreover, you can include the standard template library (STL) with a single include:  

    #include <bits/stdc++.h>

So your template for competitive programming could look like this:  

```cpp
#include <bits/stdc++.h>
using namespace std;

int main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    return 0;
}```


It is recommended to use cout << “\n”; instead of cout << endl;. endl is slower because it forces a flushing stream, which is usually unnecessary (See [this](https://www.geeksforgeeks.org/endl-vs-n/) for details). (You’d need to flush if you were writing, say, an interactive progress bar, but not when writing a million lines of data.) Write ‘\n instead of endl.

**Normal I/O:** The code below uses cin and cout. The solution gets accepted with a runtime of 2.17 seconds. 

C++

```cpp
// A normal IO example code
#include <bits/stdc++.h>
using namespace std;
int main()
{
	int n, k, t;
	int cnt = 0;
	cin >> n >> k;
	for (int i=0; i<n; i++)
	{
		cin >> t;
		if (t % k == 0)
			cnt++;
	}
	cout << cnt << "\n";
	return 0;
}
```

**Fast I/O** However, we can do better and reduce the runtime a lot by adding two lines. The program below gets accepted with a runtime of 0.41 seconds.

C++

```cpp
// A fast IO program
#include <bits/stdc++.h>
using namespace std;

int main()
{
	// added the two lines below
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	
	int n, k, t;
	int cnt = 0;
	cin >> n >> k;
	for (int i=0; i<n; i++)
	{
		cin >> t;
		if (t % k == 0)
			cnt++;
	}
	cout << cnt << "\n";
	return 0;
}
```

## IO Manipulation

---

C++ provides various I/O manipulators that can be used to format input/output operations. These manipulators can be used with std::cout and std::cin objects to format the output and input data respectively.

**std::boolalpha** - This manipulator is used to output boolean values as "true" or "false" instead of 1 or 0. For example, **std::cout << std::boolalpha << true;** will output **"true"**.

**std::showpoint** - This manipulator is used to display the decimal point in floating-point numbers even if there are no decimal places. For example, **std::cout << std::showpoint << 3.0;** will output **"3.0"**.

**std::uppercase** - This manipulator is used to output hexadecimal numbers in uppercase letters. For example, **std::cout << std::hex << std::uppercase << 255;** will output **"FF"**.

**std::nouppercase** - This manipulator is used to output hexadecimal numbers in lowercase letters. For example, **std::cout << std::hex << std::nouppercase << 255;** will output **"ff"**.

**std::hex** - This manipulator is used to output integer values in hexadecimal format. For example, **std::cout << std::hex << 255;** will output **"ff"**.

**std::dec** - This manipulator is used to output integer values in decimal format. For example, **std::cout << std::dec << 255;** will output **"255"**.

**std::oct** - This manipulator is used to output integer values in octal format. For example, **std::cout << std::oct << 255;** will output **"377"**.

Example - 

C++

```cpp
// Code implementation showing the use of hex, dec and oct

#include <iostream>
#include <iomanip>

using namespace std;

int main() {
    cout << hex << 123 << endl;      // Outputs: 7b
    cout << oct << 456 << endl;      // Outputs: 710
    cout << dec << 789 << endl;      // Outputs: 789
}
```

  
**Output**

```
7b
710
789
```

These are just a few more examples of I/O manipulators in C++. By using these manipulators and others, you can customize the output of your data to fit your specific needs.