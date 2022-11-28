#include <stdio.h>
#include <stdlib.h>

#include "codecpp.h"

int main()
{
    printf("\n == EXPERIMENT 1 - std::string C-wrapper ======\n");
    hString str = string_new1("A C++ string in C");
    string_disp(str, "str");
    hString str2 = string_copy(str);
    string_add(str, " - hello world");
    string_disp(str, "str");
    string_disp(str2, "str2");
    string_del(str);
    string_del(str2);

    printf("\n == EXPERIMENT 2 - Class Runstat ======\n");
    pStat obj = Runstat_new();
    Runstat_add(obj, 10.0);
    Runstat_add(obj, 4.0);
    Runstat_add(obj, 25.0);
    Runstat_add(obj, 16.0);

    printf(" Number of Elements processed = %zu \n", Runstat_size(obj));
    printf(" Mean = %.5f \n", Runstat_mean(obj));
    printf(" Sdev = %.5f \n", Runstat_sdev(obj));

    Runstat_add(obj, -50.0);
    Runstat_add(obj, 80.0);
    printf(" Mean = %.5f \n", Runstat_mean(obj));
    printf(" Sdev = %.5f \n", Runstat_sdev(obj));
    // Delete C++ Object
    Runstat_del(obj);
    return 0;
}