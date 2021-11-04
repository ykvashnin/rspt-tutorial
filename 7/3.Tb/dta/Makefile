../dataForm: \
	form \
	prnt_array \
	header \
	length_scale_form \
	brillouin_zone_integration \
	panel_data \
	bravais_lattice \
	fourier_grid \
	spin_data \
	element_65 
	stick form >../dataForm

panel_data: panel_data_form tail_energies
	stick panel_data_form >panel_data

../data: ../dataForm ../length_scale
	cd ../; stick dataForm >data
