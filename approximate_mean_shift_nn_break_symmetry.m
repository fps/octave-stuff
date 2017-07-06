# A is a row vector of assignments 1:rows(K)
function ret = approximate_mean_shift_nn_break_symmetry(A)
    ret = A;
    for row = 1:rows(A)
        if ret(ret(row)) == row
            "."
            ret(row) = row;
        end
    end
end
