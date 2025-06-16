v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 40 -710 580 -370 {flags=graph
y1=-0.85
y2=1.1
ypos1=0
ypos2=2
divy=5
subdivy=8
unity=1
x1=-0.98267343
x2=7.0173266
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0
node=ac1.out
color=7
dataset=-1
unitx=1
logx=1
logy=1
autoload=1
sim_type=ac
rawfile=$netlist_dir/test_cs.raw}
N 280 -230 280 -200 {lab=OUT}
N 280 -170 330 -170 {lab=GND}
N 330 -170 330 -90 {lab=GND}
N 140 -80 330 -80 {lab=GND}
N 330 -90 330 -80 {lab=GND}
N 140 -170 240 -170 {lab=IN}
N 140 -170 140 -160 {lab=IN}
N 280 -120 280 -80 {lab=GND}
N 280 -140 280 -120 {lab=GND}
N 60 -80 140 -80 {lab=GND}
N 60 -170 60 -80 {lab=GND}
N 140 -100 140 -80 {lab=GND}
N 60 -310 60 -230 {lab=VDD}
N 60 -310 280 -310 {lab=VDD}
N 280 -310 280 -290 {lab=VDD}
N 280 -210 470 -210 {lab=OUT}
N 330 -80 440 -80 {lab=GND}
N 440 -110 440 -80 {lab=GND}
N 440 -210 440 -170 {lab=OUT}
N 230 -260 260 -260 {lab=GND}
N 240 -80 240 -70 {lab=GND}
C {nmos1v2hvt_4.sym} 260 -170 0 0 {name=M1
W=40e-6
L=0.11e-6
nf=8 
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
C {rnpolyh.sym} 280 -260 0 0 {name=R1
w=1e-6
l=100e-6
model=rnpolyh
spiceprefix=X
m=1}
C {vsource.sym} 140 -130 0 0 {name=V1 value="DC 0.3 AC 1" savecurrent=false}
C {gnd.sym} 240 -70 0 0 {name=l1 lab=GND}
C {vsource.sym} 60 -200 0 0 {name=V2 value=1.2 savecurrent=false}
C {lab_pin.sym} 60 -310 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 140 -170 0 0 {name=p2 sig_type=std_logic lab=IN

}
C {capa-2.sym} 440 -140 0 0 {name=C1
m=1
value=1p
footprint=1206
device=polarized_capacitor}
C {lab_pin.sym} 470 -210 0 1 {name=p3 sig_type=std_logic lab=OUT

}
C {gnd.sym} 230 -260 0 0 {name=l2 lab=GND}
C {code_shown.sym} 630 -600 0 0 {name=control_mode only_toplevel=false value="

.lib '../../models/lf11is.lib' 1v2hvt_tt
.lib '../../models/lf11is.lib' res_typ

.option temp=21
.option savecurrents
.save all @n.xm1.nm1[gm] @n.xm1.nm1[ids]

.control
pre_osdi ../../models/psp103.osdi

*DC OP
*op
*print @n.xm1.nm1[ids] 
*write test_cs.raw

*AC
*set appendwrite
ac dec 20 1 100Meg
plot db(ac1.OUT)
save ac1.OUT
write test_cs.raw ac1.OUT

.endc

"
}
C {ngspice_get_value.sym} 220 -200 0 0 {name=r2 node=i(@n.xm1.nm1[ids])
descr="I="}
C {launcher.sym} 270 -750 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/test_cs.raw ac"
}
C {code_shown.sym} 1090 -620 0 0 {name=batch_mode only_toplevel=false value="

.lib '../../models/lf11is.lib' 1v2hvt_tt
.lib '../../models/lf11is.lib' res_typ

.option temp=21
.option savecurrents
.save all @n.xm1.nm1[gm] @n.xm1.nm1[ids]

.control
pre_osdi ../../models/psp103.osdi

*DC OP
op
print @n.xm1.nm1[ids] 
*write test_cs.raw

*AC
set appendwrite
ac dec 20 1 100Meg
plot db(ac1.OUT)
save ac1.OUT
*write test_cs.raw ac1.OUT

.endc

"
spice_ignore=true}
