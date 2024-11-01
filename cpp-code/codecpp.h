#ifndef _CODECPP_
#define _CODECPP_

#ifdef __cplusplus
  #define EXPORT_C extern "C"
#else
  #define EXPORT_C
#endif

//============ C++ Only Header =================//
#ifdef __cplusplus
#include <iostream>

class Runstat
{
    /// Sum of sequence processed
    double m_sum;
    /// Sum of squares processed
    double m_sumsq;
    /// Size of sequence processed
    size_t m_N;
public:
    Runstat();
    Runstat(Runstat const&)            = delete;
    Runstat& operator=(Runstat const&) = delete;
    ~Runstat();
    void   add(double x);
    void   reset();
    size_t size() const;
    double mean() const;
    /// Standard deviation
    double sdev() const;
};

#endif //-- End of __cplusplus definition //


// ========== C-interface for std::string container
typedef  void* hString;

EXPORT_C hString string_new();
EXPORT_C hString string_new1 (const char* text);
EXPORT_C hString string_copy (hString self);
EXPORT_C void    string_del  (hString self);
EXPORT_C void    string_add  (hString self, const char* text);
EXPORT_C void    string_disp (hString, const char* name);


//============ C-interface for class Runstat ============//

// Opaque pointer type alias for C-lang
#include <stddef.h>

typedef void* pStat;

EXPORT_C pStat   Runstat_new();
EXPORT_C void    Runstat_del (pStat self);
EXPORT_C void    Runstat_add (pStat self, double x);
EXPORT_C double  Runstat_mean(pStat self);
EXPORT_C double  Runstat_sdev(pStat self);
EXPORT_C size_t  Runstat_size(pStat self);

#endif