include ../rspthome

../atomdens: atomdens.form element_64.a
	stick atomdens.form >$(@)

element_64.a: data_64.a
	cp data_64.a atom.data; $(RSPTHOME)/bin/atom; mv atom.dens $(@)
	mv atom.out out_64.a; mv wavef_chars radii_64.a; rm -f j* atom.data wavef*

