v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 30 -100 80 -100 {lab=VG}
N 120 -150 120 -130 {lab=VD}
N 120 -150 230 -150 {lab=VD}
N 230 -150 230 -100 {lab=VD}
N 30 -30 230 -30 {lab=0}
N 230 -40 230 -30 {lab=0}
N 120 -70 120 -30 {lab=0}
N -20 -30 30 -30 {lab=0}
N -20 -100 -20 -90 {lab=VG}
N -20 -100 30 -100 {lab=VG}
N 120 -100 170 -100 {lab=0}
N 170 -100 170 -30 {lab=0}
N -30 -220 120 -220 {lab=0}
N 120 -230 120 -220 {lab=0}
N 120 -220 230 -220 {lab=0}
N -30 -300 -30 -280 {lab=0}
N -30 -370 20 -370 {lab=#net1}
N -30 -370 -30 -360 {lab=#net1}
N 60 -400 190 -400 {lab=#net2}
N 190 -400 190 -350 {lab=#net2}
N 60 -370 90 -370 {lab=#net2}
N 90 -400 90 -370 {lab=#net2}
N 60 -340 60 -330 {lab=#net3}
N 60 -330 90 -330 {lab=#net3}
N -30 -280 -30 -250 {lab=0}
N 120 -260 120 -230 {lab=0}
N -30 -250 -30 -220 {lab=0}
N 190 -290 190 -220 {lab=0}
N 90 -330 120 -330 {lab=#net3}
N 120 -330 120 -320 {lab=#net3}
C {vsource.sym} -20 -60 0 0 {name=V1 value=0.3 savecurrent=false}
C {vsource.sym} 230 -70 0 0 {name=V2 value=0.5 savecurrent=false}
C {lab_pin.sym} -20 -100 0 0 {name=p1 sig_type=std_logic lab=VG}
C {lab_pin.sym} 230 -150 0 1 {name=p2 sig_type=std_logic lab=VD
}
C {code_shown.sym} 290 -270 0 0 {name=s1 only_toplevel=false value="
.lib '../../models/lf11is.lib' 1v2hvt_tt

.option temp=21
.option savecurrents
.save all @n.xm1.nm1[gm] @n.xm1.nm1[ids]

.control
pre_osdi ../../models/psp103.osdi
op
write test_mosLF.raw
.endc
"}
C {lab_pin.sym} 230 -30 0 1 {name=p4 sig_type=std_logic lab=0
}
C {nmos1v2hvt_4.sym} 100 -100 0 0 {name=M1
W=10e-6
L=1e-6
nf=1 
mult=1
abdrain="'int((nf+1)/2) * W/nf * 0.29'" 
lsdrain="'2*int((nf+1)/2) * (W/nf + 0.29)'"
absource="'int((nf+2)/2) * W/nf * 0.29'" 
lssource="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0 dta=0
lgsource=1.0e-06
lgdrain=1.0e-06
model=nmos1v2hvt
spiceprefix=X
}
C {vsource.sym} 190 -320 0 0 {name=V3 value=1.2 savecurrent=false}
C {lab_pin.sym} 230 -220 0 1 {name=p3 sig_type=std_logic lab=0
}
C {vsource.sym} 120 -290 0 0 {name=V4 value=0.5 savecurrent=false}
C {vsource.sym} -30 -330 0 0 {name=V5 value=0.9 savecurrent=false}
C {pmos1v2hvt_4.sym} 40 -370 0 0 {name=M2
W=10e-6
L=1e-6
nf=1 
mult=1
abdrain="'int((nf+1)/2) * W/nf * 0.29'" 
lsdrain="'2*int((nf+1)/2) * (W/nf + 0.29)'"
absource="'int((nf+2)/2) * W/nf * 0.29'" 
lssource="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0 dta=0
lgsource=1.0e-06
lgdrain=1.0e-06
model=pmos1v2hvt
spiceprefix=X
}
C {ngspice_get_value.sym} 140 -140 0 0 {name=r1 node=@n.xm1.nm1[gm]
descr="gm="}
C {ngspice_get_value.sym} 140 -120 0 0 {name=r2 node=i(@n.xm1.nm1[ids])
descr="ids="}
