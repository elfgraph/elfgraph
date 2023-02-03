#include <dlfcn.h>

void foo() {
    dlopen("libbar.so", RTLD_LAZY);
}
