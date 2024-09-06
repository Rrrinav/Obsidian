Write a function to generate all possible n pairs of balanced parentheses. 

**Examples:** 

**Input:** n=1
**Output:** {}
**Explanation:** This the only sequence of balanced 
parenthesis formed using 1 pair of balanced parenthesis. 

**Input :** n=2
**Output:** 
{}{}
{{}}
**Explanation:** This the only two sequences of balanced 
parenthesis formed using 2 pair of balanced parenthesis. 
 

**Approach 1:** To form all the sequences of balanced bracket subsequences with n pairs. So there are n opening brackets and n closing brackets.   
So the subsequence will be of length 2*n. There is a simple idea, the i'th character can be '{' if and only if the count of '{' till i'th is less than n and i'th character can be '}' if and only if the count of '{' is greater than the count of '}' till index i. If these two cases are followed then the resulting subsequence will always be balanced.   
So form the recursive function using the above two cases.

**Algorithm:**  

- Create a recursive function that accepts a string (s), count of opening brackets (o) and count of closing brackets (c) and the value of n.
- if the value of opening bracket and closing bracket is equal to n then print the string and return.
- If the count of opening bracket is greater than count of closing bracket then call the function recursively with the following parameters String _s + "}"_, count of opening bracket _o_, count of closing bracket _c + 1_, and n.
- If the count of opening bracket is less than n then call the function recursively with the following parameters String _s + "{"_, count of opening bracket _o + 1_, count of closing bracket _c_, and n.

**Implementation:** 

```cpp
#include <iostream>

#define MAX_SIZE 100

void _printParenthesis(int pos, int n, int open, int close);

void printParenthesis(int n)
{
	if (n > 0)
		_printParenthesis(0, n, 0, 0);
return;
}

void _printParenthesis(int pos, int n, int open, int close)
{
	static char str[MAX_SIZE];
	if (close == n)
	{
		std::cout << str << std::endl;
		return;
	}
	else
	{
		if (open > close)
		{
			str[pos] = '}';
			_printParenthesis(pos + 1, n, open, close + 1);
		}
		if (open < n)
		{
			str[pos] = '{';
			_printParenthesis(pos + 1, n, open + 1, close);
		}
	}
}
```

  
**Output**

{{}}
{}{}

**Time complexity:** **O(2^n)**, as there are 2^n possible combinations of '(' and ')' parentheses.  
**Auxiliary space:** **O(n)**, as n characters are stored in the str array.

**Let's see the implementation of the same algorithm in a slightly different, simple and concise way :**

```cpp

// c++ program to print all the combinations of balanced

// parenthesis.

#include <bits/stdc++.h>

using namespace std;

// function which generates all possible n pairs of balanced

// parentheses. open : count of the number of open

// parentheses used in generating the current string s. close

// : count of the number of closed parentheses used in

// generating the current string s. s : currently generated

// string/ ans : a vector of strings to store all the valid

// parentheses.

void generateParenthesis(int n, int open, int close, string s, vector<string> &ans)

{

// if the count of both open and close parentheses

// reaches n, it means we have generated a valid

// parentheses. So, we add the currently generated string

// s to the final ans and return.

if (open == n && close == n)

{

ans.push_back(s);

return;

}

// At any index i in the generation of the string s, we

// can put an open parentheses only if its count until

// that time is less than n.

if (open < n)

generateParenthesis(n, open + 1, close, s + "{", ans);

// At any index i in the generation of the string s, we

// can put a closed parentheses only if its count until

// that time is less than the count of open parentheses.

if (close < open)

generateParenthesis(n, open, close + 1, s + "}", ans);

}

int main()

{

int n = 3;

// vector ans is created to store all the possible valid

// combinations of the parentheses.

vector<string> ans;

// initially we are passing the counts of open and close

// as 0, and the string s as an empty string.

generateParenthesis(n, 0, 0, "", ans);

// Now, here we print out all the combinations.

for (auto s : ans) cout << s << endl;

return 0;

}

```
  
**Output**

{{{}}}
{{}{}}
{{}}{}
{}{{}}
{}{}{}

  
**Complexity Analysis:** 

- **Time Complexity:** O(2^n).   
    For every index there can be two options '{' or '}'. So it can be said that the upper bound of time complexity is O(2^n) or it has exponential time complexity.
- **Auxiliary Space:** O(n).   
    The space complexity can be reduced to O(n) if global variable or static variable is used to store the output string.

Mark as Read

Report An Issue