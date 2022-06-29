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
def deep_dup
    
end



