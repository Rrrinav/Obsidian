
---

Two pointers is really an easy and effective technique that is typically used for searching pairs in a sorted array.  
Given a sorted array A (sorted in ascending order), having N integers, find if there exists any pair of elements (A[i], A[j]) such that their sum is equal to X.

**Illustration :** 

A[] = {10, 20, 35, 50, 75, 80}
X = =70
i = 0
j = 5

A[i] + A[j] = 10 + 80 = 90
Since A[i] + A[j] > X, j--
i = 0
j = 4

A[i] + A[j] = 10 + 75 = 85
Since A[i] + A[j] > X, j--
i = 0
j = 3

A[i] + A[j] = 10 + 50 = 60
Since A[i] + A[j] < X, i++
i = 1
j = 3
m
A[i] + A[j] = 20 + 50 = 70
Thus this signifies that Pair is Found.


Let us do discuss the [working of two pointer algorithm](https://www.geeksforgeeks.org/two-pointers-technique/) in brief which is as follows. The algorithm basically uses the fact that the input array is sorted. We start the sum of extreme values (smallest and largest) and conditionally move both pointers. We move left pointer 'i' when the sum of A[i] and A[j] is less than X. We do not miss any pair because the sum is already smaller than X. Same logic applies for right pointer j.
  

**Methods:**
Here we will be proposing a two-pointer algorithm by starting off with the naïve approach only in order to showcase the execution of operations going on in both methods and secondary to justify how two-pointer algorithm optimizes code via time complexities across all dynamic programming languages such as C+, Java, Python, and even JavaScript

1. Naïve Approach using loops
2. Optimal approach using two pointer algorithm
**Implementation:**

  **Method 1:** Naïve Approach 

**Examples** 

  
  
  

> C++

```cpp
// C++ Program Illustrating Naive Approach to
// Find if There is a Pair in A[0..N-1] with Given Sum

// Importing all libraries
#include <bits/stdc++.h>

using namespace std;

bool isPairSum(int A[], int N, int X)
{
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            // as equal i and j means same element
            if (i == j)
                continue;

            // pair exists
            if (A[i] + A[j] == X)
                return true;

            // as the array is sorted
            if (A[i] + A[j] > X)
                break;
        }
    }

    // No pair found with given sum.
    return false;
}

// Driver code
int main()
{
    int arr[] = { 2, 3, 5, 8, 9, 10, 11 };
    int val = 17;
    int arrSize = *(&arr + 1) - arr;
    sort(arr, arr + arrSize); // Sort the array
    // Function call
    cout << isPairSum(arr, arrSize, val);

    return 0;
}

```
  **Output**
1
 
> **Time Complexity:**  O(n2).
  
  
**Method 2:** Two Pointers Technique
Now let’s see how the two-pointer technique works. We take two pointers, one representing the first element and other representing the last element of the array, and then we add the values kept at both the pointers. If their sum is smaller than X then we shift the left pointer to right or if their sum is greater than X then we shift the right pointer to left, in order to get closer to the sum. We keep moving the pointers until we get the sum as X. 

**Examples**

  
  
  

> C++
```cpp
// C++ Program Illustrating Naive Approach to
// Find if There is a Pair in A[0..N-1] with Given Sum
// Using Two-pointers Technique

// Importing required libraries 
#include <iostream>
#include <algorithm>

using namespace std;

// Two pointer technique based solution to find
// if there is a pair in A[0..N-1] with a given sum.
int isPairSum(int A[], int N, int X)
{
    // represents first pointer
    int i = 0;

    // represents second pointer
    int j = N - 1;

    while (i < j) {

        // If we find a pair
        if (A[i] + A[j] == X)
            return 1;

        // If sum of elements at current
        // pointers is less, we move towards
        // higher values by doing i++
        else if (A[i] + A[j] < X)
            i++;

        // If sum of elements at current
        // pointers is more, we move towards
        // lower values by doing j--
        else
            j--;
    }
    return 0;
}

// Driver code
int main()
{
    // array declaration
    int arr[] = { 2, 3, 5, 8, 9, 10, 11 };
    
    // value to search
    int val = 17;
    
    // size of the array
    int arrSize = *(&arr + 1) - arr;
    
      // array should be sorted before using two-pointer technique
      sort(arr, arr+7);
  
    // Function call
    cout << (bool)isPairSum(arr, arrSize, val);

    return 0;
}

```

  

  
**Output**

1 
> **Time Complexity:**  O(n)


**More problems based on two pointer technique.** 


- [Find the closest pair from two sorted arrays](https://www.geeksforgeeks.org/given-two-sorted-arrays-number-x-find-pair-whose-sum-closest-x/)
- [Find the pair in array whose sum is closest to x](https://www.geeksforgeeks.org/given-sorted-array-number-x-find-pair-array-whose-sum-closest-x/)
- [Find all triplets with zero sum](https://www.geeksforgeeks.org/find-triplets-array-whose-sum-equal-zero/)
- [Find a triplet that sum to a given value](https://www.geeksforgeeks.org/find-a-triplet-that-sum-to-a-given-value/)
- [Find a triplet such that sum of two equals to third element](https://www.geeksforgeeks.org/find-triplet-sum-two-equals-third-element/)
- [Find four elements that sum to a given value](https://www.geeksforgeeks.org/find-four-numbers-with-sum-equal-to-given-sum/)