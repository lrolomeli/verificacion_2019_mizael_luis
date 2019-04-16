if [file exists work] {vdel -all}
vlib work
vlog +define+MODELSIM -f files.f
onbreak {resume}
set NoQuitOnFinish 1
vsim -voptargs=+acc work.tb_p02
do wave.do
run 1500ns
