v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 80 70 90 70 {lab=0}
N 90 30 90 70 {lab=0}
N 90 -70 90 -30 {lab=#net1}
N -30 -70 90 -70 {lab=#net1}
N -30 -70 -30 -30 {lab=#net1}
N -30 30 -30 60 {lab=0}
N -30 60 90 60 {lab=0}
N 50 0 70 -0 {lab=0}
N 50 0 50 60 {lab=0}
C {lab_pin.sym} 80 70 0 0 {name=p1 sig_type=std_logic lab=0}
C {vsource.sym} -30 0 0 0 {name=V1 value=1 savecurrent=false}
C {code_shown.sym} 260 -40 0 0 {name=s1 only_toplevel=false value="
.lib '../../models/lf11is.lib' res_typ
*Following lines necessary for DcOp
.option savecurrents
.save all
*
.control
*DcOp
op
write rc_filter.raw

.endc
"}
C {rnpolyh.sym} 90 0 0 0 {name=R1
w=1e-6
l=50e-6
model=rnpolyh
spiceprefix=X
mult=1}
