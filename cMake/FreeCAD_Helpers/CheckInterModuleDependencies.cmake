macro(CheckInterModuleDependencies)
    # ==============================================================================
    #inter-module dependencies

    # Takes a dependent module followed by a variable-length list of prerequisite
    # modules.  Warns if any of the prerequisite modules are disabled.
    function(REQUIRES_MODS dependent)
        if(${dependent})
            foreach(prerequisite IN LISTS ARGN)
                if(NOT ${prerequisite})
                    message(STATUS "${dependent} requires ${prerequisite} to be ON, but it"
                                   " is \"${${prerequisite}}\"")
                    set(${dependent} OFF PARENT_SCOPE)
                    break()
                endif(NOT ${prerequisite})
            endforeach()
        endif(${dependent})
    endfunction(REQUIRES_MODS)

    REQUIRES_MODS(BUILD_DRAFT              BUILD_SKETCHER)
    REQUIRES_MODS(BUILD_DRAWING            BUILD_PART BUILD_SPREADSHEET)
    REQUIRES_MODS(BUILD_FEM                BUILD_PART)
    REQUIRES_MODS(BUILD_IDF                BUILD_PART)
    REQUIRES_MODS(BUILD_IMPORT             BUILD_PART)
    REQUIRES_MODS(BUILD_INSPECTION         BUILD_MESH BUILD_POINTS BUILD_PART)
    REQUIRES_MODS(BUILD_JTREADER           BUILD_MESH)
    REQUIRES_MODS(BUILD_MESH_PART          BUILD_PART BUILD_MESH BUILD_SMESH)
    REQUIRES_MODS(BUILD_FLAT_MESH          BUILD_MESH_PART)
    REQUIRES_MODS(BUILD_PART_DESIGN        BUILD_SKETCHER)
    REQUIRES_MODS(BUILD_RAYTRACING         BUILD_PART)
    REQUIRES_MODS(BUILD_SANDBOX            BUILD_PART BUILD_MESH)
    REQUIRES_MODS(BUILD_SKETCHER           BUILD_PART)
    REQUIRES_MODS(BUILD_TECHDRAW           BUILD_PART BUILD_SPREADSHEET)
endmacro(CheckInterModuleDependencies)
