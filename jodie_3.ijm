
nme=split(getTitle(), ".");
nme=nme[0]+"_Results.xls";

run("Set Scale...", "distance=438 known=275 unit=um");
run("Set Measurements...", "area feret's redirect=None decimal=5");
run("Split Channels");
run("Close");
run("Close");
run("Gaussian Blur...", "sigma=1.5 scaled");
run("Invert");



setTool("freehand");
run("Select All");
waitForUser("Define Analysis ROI","Run Find Maxima and then modify any cell boundaries before clicking OK");



SegmentedID = getImageID();




run("Select None");
run("Analyze Particles...", "  show=[Overlay Masks] display exclude clear add");
rename("Labels");
run("3-3-2 RGB");
resetMinAndMax();
LabelsID = getImageID();

selectImage(SegmentedID);
setThreshold(1, 255);
run("Convert to Mask");




Table.rename("Results", nme);
path=getDirectory("Where to save the results?");
saveAs("Results", path+nme);
