/***  File Header  ************************************************************/
/**
* tfl_helper.h
*
* Private helper functions for Tensorflow lite
* @author	   Shozo Fukuda
* @date	create Thu Nov 12 17:55:58 JST 2020
* System	   MINGW64/Windows 10<br>
*
*******************************************************************************/
#ifndef _TFL_HELPER_H
#define _TFL_HELPER_H

/**************************************************************************}}}**
* inline
***************************************************************************{{{*/
// get size dimension size of the tensor
inline int size_of_dimension(const TfLiteTensor* t, int dim) {
    return (dim < t->dims->size) ? t->dims->data[dim] : -1;
}

// judge all elements of the array above threshold or not
inline bool any_one_above(int count, float* values, float threshold) {
    for (int i = 0; i < count; i++) {
        if (values[i] >= threshold) { return true; }
    }
    return false;
}

#endif /* _TFL_HELPER_H */
