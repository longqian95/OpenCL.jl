#=== TypeAliases ===#

# Opaque types
typealias CL_platform_id        Ptr{Void}
typealias CL_device_id          Ptr{Void}
typealias CL_context            Ptr{Void}
typealias CL_command_queue      Ptr{Void}
typealias CL_mem                Ptr{Void}
typealias CL_program            Ptr{Void}
typealias CL_kernel             Ptr{Void}
typealias CL_event              Ptr{Void}
typealias CL_sampler            Ptr{Void}

# Scalar types
typealias CL_char   Int8
typealias CL_uchar  UInt8
typealias CL_short  Int16
typealias CL_ushort UInt16
typealias CL_int    Int32
typealias CL_uint   UInt32
typealias CL_long   Int64
typealias CL_ulong  UInt64

typealias CL_half   UInt16
typealias CL_float  Float32
typealias CL_double Float64

typealias CL_bool                       CL_uint
typealias CL_bitfield                   CL_ulong
typealias CL_device_type                CL_bitfield
typealias CL_platform_info              CL_uint
typealias CL_device_info                CL_uint
typealias CL_device_fp_config           CL_bitfield
typealias CL_device_mem_cache_type      CL_uint
typealias CL_device_local_mem_type      CL_uint
typealias CL_device_exec_capabilities   CL_bitfield
typealias CL_device_svm_capabilities    CL_bitfield
typealias CL_command_queue_properties   CL_bitfield
typealias CL_device_partition_property  Cssize_t #intptr_t
typealias CL_device_affinity_domain     CL_bitfield

typealias CL_context_properties         Cssize_t #intptr_t
typealias CL_context_info               CL_uint
typealias CL_queue_properties           CL_bitfield
typealias CL_command_queue_info         CL_uint
typealias CL_channel_order              CL_uint
typealias CL_channel_type               CL_uint
typealias CL_mem_flags                  CL_bitfield
typealias CL_svm_mem_flags              CL_bitfield
typealias CL_mem_object_type            CL_uint
typealias CL_mem_info                   CL_uint
typealias CL_mem_migration_flags        CL_bitfield
typealias CL_image_info                 CL_uint
typealias CL_buffer_create_type         CL_uint
typealias CL_addressing_mode            CL_uint
typealias CL_filter_mode                CL_uint
typealias CL_sampler_info               CL_uint
typealias CL_map_flags                  CL_bitfield
typealias CL_pipe_properties            Cssize_t #intptr_t
typealias CL_pipe_info                  CL_uint
typealias CL_program_info               CL_uint
typealias CL_program_build_info         CL_uint
typealias CL_build_status               CL_int
typealias CL_kernel_info                CL_uint
typealias CL_kernel_work_group_info     CL_uint
typealias CL_event_info                 CL_uint
typealias CL_command_type               CL_uint
typealias CL_profiling_info             CL_uint
typealias CL_sampler_properties         CL_bitfield
typealias CL_kernel_exec_info           CL_uint

# Scalar OpenGL types ! We should get these from OpenGL.jl

typealias GL_uint                       UInt32
typealias GL_int                        Int32

typealias GL_enum                       GL_uint

# interop types

typealias CL_GL_object_type             CL_uint
typealias CL_GL_texture_info            CL_uint
typealias CL_GL_platform_info           CL_uint
typealias CL_gl_context_info            CL_uint


typealias GL_sync                       Ptr{Void}

#=== Image Types ===#

immutable CL_image_format
    image_channel_order::CL_channel_order
    image_channel_data_type::CL_channel_type
end

immutable CL_image_desc
    image_type::CL_mem_object_type
    image_width::Csize_t
    image_depth::Csize_t
    image_array_size::Csize_t
    image_row_pitch::Csize_t
    image_slice_pitch::Csize_t
    num_mip_levels::CL_uint
    num_samples::CL_uint
    buffer::CL_mem
end

immutable CL_buffer_region
    origin::Csize_t
    size::Csize_t
end


#=== Conversion Functions ===#

cl_char(x)     = @compat Int8(x)
cl_uchar(x)    = @compat UInt8(x)
cl_short(x)    = @compat Int16(x)
cl_ushort(x)   = @compat UInt16(x)
cl_int(x)      = @compat Int32(x)
cl_uint(x)     = @compat UInt32(x)
cl_long(x)     = @compat Int64(x)
cl_ulong(x)    = @compat UInt64(x)

cl_half(x)     = @compat UInt16(x)
cl_float(x)    = @compat Float32(x)
cl_double(x)   = @compat Float64(x)

cl_bool(x)     = x != 0 ? cl_uint(1) : cl_uint(0)
cl_bitfield(x) = cl_ulong(x)

cl_command_queue_properties(x) = cl_ulong(x)
cl_device_type(x)              = cl_bitfield(x)
cl_platform_info(x)            = cl_uint(x)
cl_device_info(x)              = cl_uint(x)
cl_device_fp_config(x)         = cl_bitfield(x)
cl_device_mem_cache_type(x)    = cl_uint(x)
cl_device_local_mem_type(x)    = cl_uint(x)
cl_device_exec_capabilities(x) = cl_bitfield(x)
cl_device_svm_capabilities(x)  = cl_bitfield(x)
cl_command_queue_properties(x) = cl_bitfield(x)

cl_context_properties(x)       = convert(CL_context_properties, x)
cl_context_info(x)             = cl_uint(x)
cl_queue_properties(x)         = cl_bitfield(x)
cl_command_queue_info(x)       = cl_uint(x)
cl_channel_order(x)            = cl_uint(x)
cl_channel_type(x)             = cl_uint(x)
cl_mem_flags(x)                = cl_bitfield(x)
cl_svm_mem_flags(x)            = cl_bitfield(x)
cl_mem_object_type(x)          = cl_uint(x)
cl_mem_info(x)                 = cl_uint(x)
cl_image_info(x)               = cl_uint(x)
cl_buffer_create_type(x)       = cl_uint(x)
cl_addressing_mode(x)          = cl_uint(x)
cl_filter_mode(x)              = cl_uint(x)
cl_sampler_info(x)             = cl_uint(x)
cl_map_flags(x)                = cl_bitfield(x)
cl_pipe_properties(x)          = convert(CL_pipe_properties, x)
cl_pipe_info(x)                = cl_uint(x)
cl_program_info(x)             = cl_uint(x)
cl_program_build_info(x)       = cl_uint(x)
cl_build_status(x)             = cl_int(x)
cl_kernel_info(x)              = cl_uint(x)
cl_kernel_work_group_info(x)   = cl_uint(x)
cl_event_info(x)               = cl_uint(x)
cl_command_type(x)             = cl_uint(x)
cl_profiling_info(x)           = cl_uint(x)
cl_sampler_properties(x)       = cl_bitfield(x)
cl_kernel_exec(x)              = cl_uint(x)

if VERSION < v"0.4.0-dev+1419"
    cl_platform_id(x) = convert(Ptr{Void}, x)
else
    cl_platform_id(x) = Ptr{Void}(x)
end
