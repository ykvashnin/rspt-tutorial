SHELL=/bin/bash

include rspthome
DTAFILES = dta/*
DATAFILES = dataForm length_scale

RUNSPATH = $(RSPTHOME)/runRspt
INCLUDES = -I$(RSPTHOME)/include
LIBPATHS = -L$(RSPTHOME)/lib -L./
LIBS = -ljxwac -lm
CC = icc
CFLAGS = -O2 -fno-gnu-keywords -g -traceback $(INCLUDES)

what:
	echo make what?

CLEARFILES = \
apts gaucof gvector histgram symcof_new\
out_last pot_last eparm_last\
vplot[1-2] dplot[1-2].dat jacob[1-2] ejac[1-2]\
runsf.dta\
convergence rsptlogc runs_errfile

clear:
	rm -f $(CLEARFILES)

CLEANFILES = $(CLEARFILES) \
atomdens data energy_matrices hist smeardata ml_occupation\
interstitialenergy eparm pot desic deorbpol momfix.dat\
rspt_fft_wisdom rspt_fft_wisdom.* runsEnergyLog forces\
efgArray.dat efgData.out efgArray.dat.0 efgData.out.0\
imag-sigma-*.dat real-sigma-*.dat dmft_hist

clean:
	rm -f $(CLEANFILES)

tarfile:
	tar cvzf `date +%y%m%d`.$(MATERIAL).tgz \
		Makefile \
		atom \
		bin \
		bz \
		dataForm length_scale \
		deltatau \
		dplot1 \
		doc \
		dos.inp \
		dta \
		e_entropy \
		hist \
		input_parameters \
		lengths \
		para.glo \
		results \
		spts \
		strains \
		sym \
		symcof \
		tetra
data: $(DATAFILES)
	@if [ -f data ]; then if [ -f data.xxx ]; then rm data.xxx; fi; cp data data.xxx; fi
	@stick dataForm >data
	echo "	stick dataForm >data"
	@if [ -f data.xxx ]; then diff data data.xxx; rm data.xxx; fi
dataForm: $(DTAFILES)
	cd dta; make ../dataForm
	echo "	cd dta; make ../dataForm"
optimize: \
	bin/init_rspt_data.o \
	$(RUNSPATH)/drive_zero_derivs.o \
	$(RUNSPATH)/zero_derivs.o \
	$(RUNSPATH)/runs.o \
	$(RUNSPATH)/modpot.o
	cd bin; \
		$(CC) $(CFLAGS) $(LIBPATHS) -o ../$@ \
							$(RUNSPATH)/drive_zero_derivs.o \
							$(RUNSPATH)/zero_derivs.o \
							$(RUNSPATH)/runs.o \
							$(RUNSPATH)/modpot.o \
							init_rspt_data.o \
							$(LIBS)

optimize_1: \
	bin/init_rspt_data.o \
	$(RUNSPATH)/drive_step_min.o \
	$(RUNSPATH)/step_min.o \
	$(RUNSPATH)/runs.o \
	$(RUNSPATH)/modpot.o
	cd bin; \
		$(CC) $(CFLAGS) $(LIBPATHS) -o ../$@ \
							$(RUNSPATH)/drive_step_min.o \
							$(RUNSPATH)/step_min.o \
							$(RUNSPATH)/runs.o \
							$(RUNSPATH)/modpot.o \
							init_rspt_data.o \
							$(LIBS)

minimize: \
	bin/init_rspt_data.o \
	$(RUNSPATH)/drive_minimize.o \
	$(RUNSPATH)/minimize.o \
	$(RUNSPATH)/runs.o \
	$(RUNSPATH)/modpot.o
	cd bin; \
		$(CC) $(CFLAGS) $(LIBPATHS) -o ../$@ \
							$(RUNSPATH)/drive_minimize.o \
							$(RUNSPATH)/minimize.o \
							$(RUNSPATH)/runs.o \
							$(RUNSPATH)/modpot.o \
							init_rspt_data.o \
							$(LIBS)

minimize_l: \
	bin/init_rspt_data.o \
	$(RUNSPATH)/minimize_l.o \
	$(RUNSPATH)/minimize.o \
	$(RUNSPATH)/runs.o \
	$(RUNSPATH)/modpot.o
	cd bin; \
		$(CC) $(CFLAGS) $(LIBPATHS) -o ../$@ \
							$(RUNSPATH)/minimize_l.o \
							$(RUNSPATH)/minimize.o \
							$(RUNSPATH)/runs.o \
							$(RUNSPATH)/modpot.o \
							init_rspt_data.o \
							$(LIBS)

minimizePS: \
	bin/init_rspt_data.o \
	$(RUNSPATH)/minimizePS.o \
	$(RUNSPATH)/minimize.o \
	$(RUNSPATH)/runs.o \
	$(RUNSPATH)/modpot.o
	cd bin; \
		$(CC) $(CFLAGS) $(LIBPATHS) -o ../$@ \
							$(RUNSPATH)/minimizePS.o \
							$(RUNSPATH)/minimize.o \
							$(RUNSPATH)/runs.o \
							$(RUNSPATH)/modpot.o \
							init_rspt_data.o \
							$(LIBS)

bin/init_rspt_data.o: bin/init_rspt_data.c
	cd bin; $(CC) $(CFLAGS) -c init_rspt_data.c

$(RUNSPATH)/drive_zero_derivs.o: $(RUNSPATH)/drive_zero_derivs.c
	cd $(RUNSPATH); cc $(CFLAGS) -c drive_zero_derivs.c

$(RUNSPATH)/zero_derivs.o: $(RUNSPATH)/zero_derivs.c
	cd $(RUNSPATH); cc $(CFLAGS) -c zero_derivs.c

$(RUNSPATH)/drive_step_min.o: $(RUNSPATH)/drive_step_min.c
	cd $(RUNSPATH); cc $(CFLAGS) -c drive_step_min.c

$(RUNSPATH)/step_min.o: $(RUNSPATH)/step_min.c
	cd $(RUNSPATH); cc $(CFLAGS) -c step_min.c

$(RUNSPATH)/runs.o: $(RUNSPATH)/runs.c
	cd $(RUNSPATH); cc $(CFLAGS) -c runs.c

$(RUNSPATH)/modpot.o: $(RUNSPATH)/modpot.c
	cd $(RUNSPATH); cc $(CFLAGS) -c modpot.c

