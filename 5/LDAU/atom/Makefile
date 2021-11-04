include ../rspthome

../atomdens: atomdens.form element_28.up element_28.dn element_8.a
	stick atomdens.form >$(@)

element_28.up: data_28.up
	cp data_28.up atom.data; $(RSPTHOME)/bin/atom; mv atom.dens $(@)
	mv atom.out out_28.up; mv wavef_chars radii_28.up; rm -f j* atom.data wavef*

element_28.dn: data_28.dn
	cp data_28.dn atom.data; $(RSPTHOME)/bin/atom; mv atom.dens $(@)
	mv atom.out out_28.dn; mv wavef_chars radii_28.dn; rm -f j* atom.data wavef*

element_8.a: data_8.a
	cp data_8.a atom.data; $(RSPTHOME)/bin/atom; mv atom.dens $(@)
	mv atom.out out_8.a; mv wavef_chars radii_8.a; rm -f j* atom.data wavef*

