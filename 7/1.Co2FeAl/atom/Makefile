include ../rspthome

../atomdens: atomdens.form element_27.up element_26.up element_13.a
	stick atomdens.form >$(@)

element_27.up: data_27.up
	cp data_27.up atom.data; $(RSPTHOME)/bin/atom; mv atom.dens $(@)
	mv atom.out out_27.up; mv wavef_chars radii_27.up; rm -f j* atom.data wavef*

element_26.up: data_26.up
	cp data_26.up atom.data; $(RSPTHOME)/bin/atom; mv atom.dens $(@)
	mv atom.out out_26.up; mv wavef_chars radii_26.up; rm -f j* atom.data wavef*

element_13.a: data_13.a
	cp data_13.a atom.data; $(RSPTHOME)/bin/atom; mv atom.dens $(@)
	mv atom.out out_13.a; mv wavef_chars radii_13.a; rm -f j* atom.data wavef*

