include ../rspthome

../atomdens: atomdens.form element_65.a
	stick atomdens.form >$(@)

element_65.a: data_65.a
	cp data_65.a atom.data; $(RSPTHOME)/bin/atom; mv atom.dens $(@)
	mv atom.out out_65.a; mv wavef_chars radii_65.a; rm -f j* atom.data wavef*

