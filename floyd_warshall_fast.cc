#include <octave/oct.h>
#include <iostream>
#include <algorithm>

DEFUN_DLD (floyd_warshall_fast, args, ,
  "An implementation of the Floyd Warshall Algorithm.")
{
	
	Matrix D = args(0).matrix_value();

	Matrix ret = D;

	for (unsigned int k = 0; k < D.rows(); ++k) {
		for (unsigned int i = 0; i < D.rows(); ++i) {
			for (unsigned int j = 0; j < D.rows(); ++j) {
				double new_value = std::min(
					ret(i,j), 
					ret(i,k) + ret(k,j)
				);
				ret(i,j) = new_value;
			}
		}
	}

	return octave_value(ret);
}
