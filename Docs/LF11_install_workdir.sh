#Set the paths to the xschem pdk directory and hspice models
 
export LF11_PDK_DIR=/secondary/opt/pdk/lf11_xschem/lf11_pdk_xschem
export LF11_PDK_MODELS=/secondary/opt/pdk/lf11_xschem/models
export PROJ_DIR=$(pwd)

cp $LF11_PDK_DIR/.spiceinit $HOME
cp $LF11_PDK_DIR/xschemrc .
cp $LF11_PDK_DIR/README_NEW_LIBRARY .
ln -s $LF11_PDK_MODELS

printf "append XSCHEM_LIBRARY_PATH :$LF11_PDK_DIR\n" >> xschemrc
printf "append XSCHEM_LIBRARY_PATH :$PROJ_DIR\n" >> xschemrc

echo "Read README_NEW_LIBRARY to create new libraries"




