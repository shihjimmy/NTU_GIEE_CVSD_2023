read_file -type verilog {flist.v}
set_option top core
current_goal Design_Read -top core
current_goal lint/lint_rtl -top core
run_goal
capture ./spyglass-1/core/lint/lint_rtl/spyglass_reports/spyglass_violations.rpt {write_report spyglass_violations}

exit -force
