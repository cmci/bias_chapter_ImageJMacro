selectWindow("C1-NPCsingleNucleus.tif");
run("Gaussian Blur...", "sigma=1.50 stack");

//run("Threshold...");
setAutoThreshold("Otsu dark");
setOption("BlackBackground", true);
run("Convert to Mask", "method=Otsu background=Dark calculate black");
//run("Threshold...");
run("Analyze Particles...", "size=800-Infinity pixel circularity=0.00-1.00 show=Masks display exclude clear include stack");
run("Invert LUT");
run("Duplicate...", "title=[Mask of C1-NPCsingleNucleus-1.tif] duplicate range=1-15");
selectWindow("Mask of C1-NPCsingleNucleus.tif");
run("Options...", "iterations=2 count=1 black edm=Overwrite do=Nothing");
run("Dilate", "stack");
selectWindow("Mask of C1-NPCsingleNucleus-1.tif");
run("Erode", "stack");
imageCalculator("Difference create stack", "Mask of C1-NPCsingleNucleus.tif","Mask of C1-NPCsingleNucleus-1.tif");
selectWindow("Result of Mask of C1-NPCsingleNucleus.tif");
