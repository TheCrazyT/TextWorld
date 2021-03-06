# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT license.


from cffi import FFI


ffibuilder = FFI()

with open('src/glk_comm.c') as f:
    ffibuilder.set_source("glk", f.read()
    ,
    extra_compile_args=["-fpermissive"],
    include_dirs=[
        "/usr/include/python3.6m",
        "/usr/include/python3.7"
    ]
    )

    ffibuilder.cdef(r"""
        struct sock_names {
            char* sock_name;
            ...;
        };
        """)

    ffibuilder.cdef(r"""
        int init_glulx(struct sock_names* names);
        const char* communicate(struct sock_names* names, const char* msg);
        const char* get_output_nosend(struct sock_names* names);
        void cleanup_glulx(struct sock_names* names);
        void free(void* ptr);
        """)

if __name__ == "__main__":
    ffibuilder.compile(verbose=True)
