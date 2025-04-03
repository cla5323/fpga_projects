set system "mizar_z7"

set file_list [list \
"${system}.vhd" \
]

#####################################################################

create_project adafruit_matrix ./ -part xc7z020clg400-2 -force

set_property top $system [current_fileset]
set_property target_language VHDL [current_project]
set_property strategy Performance_Explore [get_runs impl_1]

read_xdc "./${system}.xdc"
set_property target_constrs_file "./${system}.xdc" [current_fileset -constrset]

foreach name $file_list {
    read_vhdl -vhdl2008 -library work $name
}
