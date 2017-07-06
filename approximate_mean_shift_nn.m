# K is a neighbour matrix that contains 1 at pos i,j
# if j is the nearest neighbour of i
# A is a row vector of initial assignments 1:rows(K)
function ret = approximate_mean_shift_nn(K, A)
    ret = A;
    for row = 1:rows(K)
        for col = 1:columns(K)
            if K(ret(row),col) == 1 
                ret(row) = col;
            end
            #if K(A(row), A(col) == 1 && K(A(col), row) == 1 && row < col
            #    ret(row) = col;
            #end
            #if K(A(row),col) == 1 && K(col, A(row)) == 0
            #    ret(row) = col;
            #end
        end
    end
end
