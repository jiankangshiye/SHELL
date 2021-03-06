#!/bin/sh

# llvm for cortex-m3 compile
# ref: https://github.com/martinribelotta/cortex-m-llvm

mkdir llvm_cortex_m3                                       &&
cd llvm_cortex_m3                                          &&
git clone http://llvm.org/git/llvm.git                     &&
cd llvm                                                    &&
git reset --hard 1d154049a4414da81e04545ab116568773032070  &&
cd tools/                                                  &&
git clone http://llvm.org/git/clang.git                    &&
cd clang                                                   &&
git reset --hard c80ac49fb00ac4b76385011842f08bdb7ca2a323  &&
cd ../../projects/                                         &&
git clone http://llvm.org/git/compiler-rt.git              &&
cd compiler-rt                                             &&
git reset --hard b64139a2283919f60961bbd3cc923d37769acaa0  &&
cd ../../../                                               &&
mkdir build                                                &&
cd build                                                   &&
cmake  \
    -DCMAKE_BUILD_TYPE=Release  \
    -DCMAKE_INSTALL_PREFIX=/opt/llvm  \
    -DLLVM_TARGETS_TO_BUILD="Mips;ARM;X86" \
    -DLLVM_ENABLE_PIC=ON ../llvm                           &&
make -j8                                                   &&
sudo make install

