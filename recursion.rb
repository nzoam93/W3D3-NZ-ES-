require "byebug"

def range_recursion(min, max)
    return [] if max <= min
    return [min].concat(range_recursion(min + 1, max))
end

def range_iterative(min, max)
    arr = []
    (min...max).each do |i|
        arr << i
    end
    arr 
end

def recursion_1(base,n)
    return 1 if n == 0
    
    return base * recursion_1(base, n - 1)
end

def recursion_2(base, n)
    return 1 if n == 0
    return base if n == 1

    if n.even? 
        return recursion_2(base, n / 2) * recursion_2(base, n / 2)
    else
        return base * (recursion_2(base, (n - 1) / 2) * recursion_2(base, (n - 1) / 2))
    end
end

class Array
    def deep_dup
        return self if self.length <= 1 
        first_ele = self.shift
        return [first_ele] + self.deep_dup #deep_dup(self[1..-1])
    end
end

def fib_recursion(n)
    return [0] if n == 0
    return [0,1] if n == 1

    fibs = fib_recursion(n-1)
    sum = fibs[-1] + fibs[-2]
    fibs << sum
end

def fib_iterative(n)
    return nil if n < 0
    return [0] if n == 0
    return [0,1] if n == 1
    arr = [0,1,1]
    while arr.length < n
        arr << arr[-1] + arr[-2]
    end
    arr
end

def binary_search(array,target)
    return nil if array.empty?
    middle = array.length / 2
    if target < array[middle]
        binary_search(array[0...middle],target)
    elsif array[middle] == target
        return middle
    else
        idx = binary_search(array[(middle + 1)..-1],target)
        if idx != nil
            return idx + middle + 1
        else
            return nil
        end
    end
end

def merge_sort(arr)

    return arr if arr.length == 1

    middle = arr.length/2
    left_half = merge_sort(arr[0...middle])
    right_half = merge_sort(arr[middle..-1])
    
    return merge(left_half,right_half)
    # return merge((merge_sort(arr[0...middle]), merge_sort(arr[middle..-1])
end

def merge(arr_1, arr_2)
    new_arr = []
    while arr_1.length > 0 && arr_2.length > 0
        if arr_1[0] < arr_2[0]
            new_arr << arr_1.shift
        else
            new_arr << arr_2.shift
        end     
    end

    if arr_1.length == 0
        new_arr += arr_2
    elsif arr_2.length == 0
        new_arr += arr_1
    end

    return new_arr
end

# p merge_sort([7,12,25,2,21,40,3,5])
# p merge([1,2,4,10,15,17,88],[2,5,6,8,34,200])

def subsets(arr)
    return [[]] if arr.empty?
    old = subsets(arr[0...-1])
    new_arr = []
    old.each do |subarr|
        new_arr << subarr + [arr[-1]]
    end
    return old + new_arr
end

# p subsets([1,2,3])

def cat_subsets(arr)
    new_arr = []
    (0...arr.length).each do |i|
        (i...arr.length).each do |j| #nice job!
            new_arr << arr[i..j]
        end
    end
    new_arr
end

# p cat_subsets([1])


# p [1,2,3] << 4

# a = [1]
# p a[0...-1]

# new_arr = []
# [].each do |num|
#     new_arr << num + 1
# end

# p new_arr + []

def permutations(arr)
    
end

p permutations([1,2,3])