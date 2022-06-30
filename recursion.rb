require "byebug"
def range(start, ending)
    if ending <= start
        return []
    end
    
    new_arr = []
    new_arr << start
    return new_arr + range(start+1, ending)
end

# n = exponent
def exp_1(b, n)
    return 1 if n == 0

    b * exp_1(b, n - 1)
end


def exp_2(b, n)
    return 1 if n == 0
    return b if n == 1

    if n.even?
        exp_2(b, n / 2) * exp_2(b, n / 2)
    else # n is odd
        b * exp_2(b, (n - 1) / 2) * exp_2(b, (n - 1) / 2)
    end

end

def deep_dup

end

# shallow dup
# changing a's elements will also change b's elements
# a = [ [1,2], [3], 4 ]
# b = a.dup
# p b
# a[1] << 4
# p b
# a[0] << 3
# p b
# p a.object_id == b.object_id # => false

# deep dup 
# changing a's elements will not change b's elements
# a = [ [1,2], [3], 4 ]
# b = a.deep_dup # Ruby doesn't have a built-in method for deep dup
# a[1] << 4 # a[1] = [3,4]
# b[1] should still be [3]
def deep_dup(array)
    result = []

    array.each do |sub_arr|
        if sub_arr.is_a?(Array)
            result << deep_dup(sub_arr)
        else
            result << sub_arr
        end
    end
    return result
end

# a = [ [1,2], [3], 4]
# b = deep_dup(a)
# a[1] << 4
# p b
# a[0] << 3
# # should expect 'b' to not change after 'a' is changed
# puts "a = #{a}"
# puts "b = #{b}"

# Fibonacci sequence = [0,1,1,2,3,5,8,13....]
# every number in the sequence is the sum of the previous 2 numbers
# fib(n) returns the first n Fibonacci numbers in an array
# fib(4) returns [0,1,1,2]
def fib(n)
    return [] if n == 0
    return [1] if n == 1
    return [0, 1] if n == 2

    result = fib(n-1)
    next_num = result[-1] + result[-2]
    result << next_num
    return result
end

# result = [fib(6)] + fib(5) + fib(4) + fib(3) + fib(2) + fib(1)

# fib(1) << fib(2) << fib(3) << fib(4) << fib(5) << fib(6)
# [1] << [1] # fib(2)
# [1, 1] << [2] # fib(3)
# [1,1,2] << [3] # fib(4)
# [1,1,2,3] << [5] # fib(5)
# [1,1,2,3,5] << [8] # fib(6) => [1,1,2,3,5,8]


# [1, 5, 8, 18, 20, | 26, 35, 65, 86, 101]
# find 99
# 1. determine if goal is > or < middle
# 2. take left or right half
# [26, 35, 65, 86, 101]
# [86, 101]
# [101]
def binary_search(array, target)
    if array.length == 0
        return nil
    end

    mid_idx = array.length / 2
    mid_ele = array[mid_idx]
    left = array[0...mid_idx]
    right = array[mid_idx + 1..-1]

    if target < mid_ele
        bsearch(left, target)
    elsif target > mid_ele
        idx = bsearch(right, target)
        return nil if idx.nil?
        idx + mid_idx + 1
    else
        mid_idx
    end  
end

def merge_sort(array)
    if array.length <= 1
        return array
    end

    mid_idx =  array.length / 2
    left = array[0...mid_idx]
    right = array[mid_idx..-1]
    sort_left = merge_sort(left)
    sort_right = merge_sort(right)
    merge(sort_left, sort_right)
end

def merge(left, right)
    new_arr = left + right
    new_arr = new_arr.sort
    new_arr
end

# arr = [38, 27, 43, 3, 9, 82, 10]
# new_arr = [38, 27, 43, 3]
# new_arr_2 = [9, 82, 10]
# p merge(new_arr, new_arr_2)
# p merge_sort(arr)

def greedy_make_change(num, denoms)
    return [] if num == 0
    change = []
    if num - denoms[0] >= 0
        change << denoms[0]
        change += greedy_make_change(num - denoms[0], denoms)
    else
        denoms.shift 
        change += greedy_make_change(num, denoms)
    end

    return change
end


# p greedy_make_change(24, [10, 7, 1])

def make_better_change(num, array)
    new_arr = []
    new_num = num - array[0]
    new_arr << array[0]
    return new_arr if new_num == array[1]
    make_better_change(new_num, array[1..-1])
    return new_arr
end

p make_better_change(24, [10, 7, 1])