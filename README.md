
The project is homework for course System on Chip(Soc) in HUST, term 2017 autumn. Finished in 2018.1.22.

The project is created on DIGILENT Zedboard based  on AD7511 HDMI display project. 

##The New Features:

1. Four ultrasonic sensor to detect distance by gesture 
2. Gesture judging based on distance variation 
3. Four Direction Button is added for another control method 
4. A picture 480*480 is cut to 9 parts. Since puzzle principle, exchange two parts in 1-8 at will for even times can made puzzle having a solution.
5. picture matrix is established to exchange the picture parts.

##Other tips:

1. Xilinx Vivado version is 2016.2
2. Project AD7511 doesn't work in version 2016.2. To be compatible, Xilinx C/C++ Complier Build Setting is changed. GCC Complier->Miscellaneous->**-mfloat-abi=hard** is changed by **-mfloat-abi=softfp**, so as GCC Linker
3. Each time you export hardware from Vivado to SDK, the bsp file is built again. As bsp file is new, Makefile need being updated. Use **mfloat-abi=softfp** replace **mfloat-abi=hard** at two places.



umm...Other problem occurs, please contact me @ wuyzhust@163.com .
