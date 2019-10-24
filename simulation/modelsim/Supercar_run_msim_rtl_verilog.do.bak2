transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/Anto-MX/Documenti/EdSE/Esercizio_1110 {/home/Anto-MX/Documenti/EdSE/Esercizio_1110/clockdivider.v}
vlog -vlog01compat -work work +incdir+/home/Anto-MX/Documenti/EdSE/Esercizio_1110 {/home/Anto-MX/Documenti/EdSE/Esercizio_1110/display7seg.v}
vlog -vlog01compat -work work +incdir+/home/Anto-MX/Documenti/EdSE/Esercizio_1110 {/home/Anto-MX/Documenti/EdSE/Esercizio_1110/cntUP.v}

vlog -vlog01compat -work work +incdir+/home/Anto-MX/Documenti/EdSE/Esercizio_1110 {/home/Anto-MX/Documenti/EdSE/Esercizio_1110/Supercar_Test.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_Supercar

add wave *
view structure
view signals
run 10 sec
